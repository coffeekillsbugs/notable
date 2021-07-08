import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sigma/services/sigma_provider.dart';
import 'package:sigma/widgets/sigma_button.dart';
import 'package:sigma/view_models/note_view_model.dart';
import 'package:sigma/theme/colors.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  bool isEditMode = false;

  late TextEditingController _titleController, _noteBodyController;
  late FocusNode _noteBodyFocusNode;

  late NoteViewModel noteViewModel;
  late SigmaProvider sigmaProvider;

  @override
  void initState() {
    super.initState();

    _noteBodyFocusNode = FocusNode();
    _titleController = TextEditingController();
    _noteBodyController = TextEditingController();

    noteViewModel = NoteViewModel();
  }

  @override
  void dispose() {
    _noteBodyFocusNode.dispose();
    _titleController.dispose();
    _noteBodyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sigmaProvider = Provider.of<SigmaProvider>(context);

    if (sigmaProvider.isEditMode) {
      isEditMode = sigmaProvider.isEditMode;
      sigmaProvider.updateEditMode();

      noteViewModel = NoteViewModel.getFromHive(sigmaProvider.selectedIndex);

      _titleController.text = noteViewModel.title;
      _noteBodyController.text = noteViewModel.noteBody!;
    }
    // >>> Note Screen
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextField(
                    autofocus: true,
                    controller: _titleController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    autocorrect: false,
                    style: Theme.of(context).textTheme.headline3,
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(10.0),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white60),
                    ),
                    onSubmitted: (text) {
                      _noteBodyFocusNode.requestFocus();
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    dateFormat(noteViewModel.dateCreated),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _noteBodyFocusNode.requestFocus();
                    },
                    child: Container(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 32.0),
                          child: TextField(
                            controller: _noteBodyController,
                            focusNode: _noteBodyFocusNode,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            style: Theme.of(context).textTheme.bodyText1,
                            cursorColor: Colors.white,
                            cursorRadius: Radius.circular(10.0),
                            cursorHeight: 20.0,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Whats on your mind?',
                              hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white60),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 88.0),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SigmaButton(
                  kHeroTag: 'white',
                  kOnPressed: () => Navigator.pop(context),
                  kIcon: Icons.chevron_left_rounded,
                  // kSize: 40.0,
                ),
                SizedBox(width: 16.0),
                SigmaButton(
                  kHeroTag: 'blackNote',
                  kOnPressed: () {
                    if (_noteBodyController.text.isEmpty) {
                      _emptyFieldWarning();
                    } else {
                      if (isEditMode) {
                        isEditMode = false;
                        noteViewModel.updateToHive(
                          sigmaProvider.selectedIndex,
                          _titleController.text,
                          noteViewModel.dateCreated,
                          noteViewModel.noteType,
                          _noteBodyController.text,
                        );
                        // sigmaProvider.updateEditMode();
                        // Show updated
                        Navigator.popAndPushNamed(context, 'NoteView');
                      } else {
                        noteViewModel.writeToHive(
                          _titleController.text,
                          noteViewModel.dateCreated,
                          noteViewModel.noteType,
                          _noteBodyController.text,
                        );
                        Navigator.pop(context);
                      }
                    }
                  },
                  kIcon: Icons.save,
                  kIconColor: Colors.white,
                  kBackgroundColor: AppColor.overlayTwelve,
                ),
              ],
            ),
          ),
        ),
      ],
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

  Future<void> _emptyFieldWarning() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'But...',
          ),
          content: Text(
            '...you haven\'t written anything.',
          ),
          actions: [
            TextButton(
              child: Text(
                'SILLY ME',
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
