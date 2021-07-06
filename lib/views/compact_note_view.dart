import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sigma/theme/colors.dart';
import 'package:sigma/view_models/note_view_model.dart';
import 'package:sigma/services/sigma_provider.dart';
import 'package:sigma/models/sigma_note.dart';

class CompactNoteView extends StatefulWidget {
  final int kIndex;

  CompactNoteView({
    required this.kIndex,
  });

  @override
  _CompactNoteViewState createState() => _CompactNoteViewState();
}

class _CompactNoteViewState extends State<CompactNoteView> {
  bool isNoteCollapsed = true;
  NoteViewModel noteViewModel = NoteViewModel();
  SigmaNote? noteObject = SigmaNote();
  late SigmaProvider sigmaProviderFalse;

  @override
  Widget build(BuildContext context) {
    noteObject = noteViewModel.getFromHiveProvider(widget.kIndex);
    sigmaProviderFalse = Provider.of<SigmaProvider>(context, listen: false);
    return Dismissible(
      key: Key(noteObject!.dateCreated.toString()),
      background: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Icon(
          Icons.edit,
          color: AppColor.darkGrey,
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(16.0),
        color: Colors.red,
        child: Icon(
          Icons.delete_rounded,
          color: AppColor.darkGrey,
        ),
      ),
      direction:
          isNoteCollapsed ? DismissDirection.horizontal : DismissDirection.none,
      dismissThresholds: {
        DismissDirection.endToStart: 0.1,
      },
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return _deleteConfirmationDialog(habitName: noteObject!.title);
        } else {
          sigmaProviderFalse.updateSelectedIndex(widget.kIndex);
          sigmaProviderFalse.updateEditMode();
          Navigator.pushNamed(context, 'NoteScreen');
        }
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          noteViewModel.deleteFromHiveProvider(widget.kIndex);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          decoration: BoxDecoration(
            color: AppColor.overlaySeven,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              // >>> Title, Collapse and Expand button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      child: Text(
                        noteObject!.title!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  InkWell(
                    splashColor: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    onTap: () {
                      setState(() {
                        if (isNoteCollapsed) {
                          isNoteCollapsed = false;
                        } else {
                          isNoteCollapsed = true;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(
                        isNoteCollapsed
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
              isNoteCollapsed
                  ? Container()
                  : Column(
                      children: [
                        SizedBox(
                          height: 8.0,
                        ),
                        // >>> Body
                        Container(
                          alignment: Alignment.topLeft,
                          height: 160.0,
                          // color: Colors.red,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Text(
                              noteObject!.noteBody!,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        // >>> Date Created
                        Container(
                          alignment: Alignment.centerLeft,
                          // color: Colors.green,
                          child: Text(
                            dateFormat(noteObject!.dateCreated!),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  String dateFormat(DateTime dateTime) {
    String _dateTime;

    _dateTime =
        '${dateTime.day} ${monthName(dateTime.month)}, ${dateTime.year}';

    return _dateTime;
  }

  String monthName(int month) {
    switch (month) {
      case 1:
        return 'January';

      case 2:
        return 'February';

      case 3:
        return 'March';

      case 4:
        return 'April';

      case 5:
        return 'May';

      case 6:
        return 'June';

      case 7:
        return 'July';

      case 8:
        return 'August';

      case 9:
        return 'September';

      case 10:
        return 'October';

      case 11:
        return 'November';

      case 12:
        return 'December';

      default:
        return 'January';
    }
  }

  Future<bool?> _deleteConfirmationDialog({String? habitName}) async {
    return showDialog<bool>(
      // barrierColor: AppColor.darkGrey.withOpacity(0.9),
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Delete?',
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Text(
                  'You\'re about to delete \"$habitName\".',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'This action is not reversible.',
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text(
                'YES',
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text(
                'NO',
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}
