import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../view_models/note_view_model.dart';
import '../models/sigma_note.dart';

class CompactNoteView extends StatefulWidget {
  final int kIndex;

  CompactNoteView({
    @required this.kIndex,
  });

  @override
  _CompactNoteViewState createState() => _CompactNoteViewState();
}

class _CompactNoteViewState extends State<CompactNoteView> {
  bool isNoteCollapsed = true;
  NoteViewModel noteViewModel = NoteViewModel();
  SigmaNote noteObject = SigmaNote();
  @override
  Widget build(BuildContext context) {

    noteObject = noteViewModel.getFromHiveProvider(widget.kIndex);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Dismissible(
        key: Key(noteObject.dateCreated.toString()),
        background: Container(),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Icon(
            Icons.delete_rounded,
            color: AppColor.darkGrey,
          ),
        ),
        direction: isNoteCollapsed ? DismissDirection.endToStart : null,
        dismissThresholds: {
          DismissDirection.endToStart: 0.1,
        },
        confirmDismiss: (direction) async {
          return _deleteConfirmationDialog(habitName: noteObject.title);
        },
        onDismissed: (direction) {
          noteViewModel.deleteFromHiveProvider(widget.kIndex);
        },
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
                        noteObject.title,
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
                        isNoteCollapsed ? Icons.visibility : Icons.visibility_off,
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
                              noteObject.noteBody,
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
                            dateFormat(noteObject.dateCreated),
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

    _dateTime = '${dateTime.day} ${monthName(dateTime.month)}, ${dateTime.year}';

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

  Future<bool> _deleteConfirmationDialog({String habitName}) async {
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
              FlatButton(
                child: Text(
                  'YES',
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              FlatButton(
                child: Text(
                  'NO',
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        }) ??
        false;
  }
}
