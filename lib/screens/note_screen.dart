import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../sigma_provider.dart';
import '../widgets/sigma_button.dart';
import '../models/sigma_note.dart';
import '../view_models/note_view_model.dart';
import '../theme/colors.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  FocusNode _noteBody;
  String _kDateTime;
  bool isEditMode = false;
  int selectedIndex;
  DateTime dateTime;

  TextEditingController _titleController, _noteBodyController;

  NoteViewModel noteViewModel = NoteViewModel();
  SigmaNote noteObject = SigmaNote();
  SigmaProvider sigmaProvider;

  @override
  void initState() {
    super.initState();

    _noteBody = FocusNode();
    _titleController = TextEditingController();
    _noteBodyController = TextEditingController();
    dateTime = DateTime.now();
  }

  @override
  void dispose() {
    _noteBody.dispose();
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
      selectedIndex = sigmaProvider.selectedIndex;

      noteObject = noteViewModel.getFromHiveProvider(selectedIndex);

      _titleController.text = noteObject.title;
      _noteBodyController.text = noteObject.noteBody;
      _kDateTime = dateFormat(noteObject.dateCreated);
    } else {
      _kDateTime = dateFormat(dateTime);
    }
    // >>> Note Screen
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                // color: Colors.white,
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
                    hintStyle: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white60),
                  ),
                  onSubmitted: (text) {
                    _noteBody.requestFocus();
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  _kDateTime,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  controller: _noteBodyController,
                  focusNode: _noteBody,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: Theme.of(context).textTheme.bodyText1,
                  cursorColor: Colors.white,
                  cursorRadius: Radius.circular(10.0),
                  cursorHeight: 20.0,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Whats on your mind?',
                    hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white60),
                  ),
                ),
              ),
              SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SigmaButton(
            kHeroTag: 'white',
            kOnPressed: () => Navigator.pop(context),
            kIcon: Icons.chevron_left_rounded,
            kSize: 40.0,
          ),
          SizedBox(width: 16.0),
          SigmaButton(
            kHeroTag: 'blackNote',
            kOnPressed: () {
              if (isEditMode) {
                isEditMode = false;
                noteViewModel.updateToHiveProvider(
                  selectedIndex,
                  SigmaNote(
                    title: _titleController.text,
                    dateCreated: noteObject.dateCreated,
                    noteType: NoteType.note,
                    noteBody: _noteBodyController.text,
                  ),
                );
                sigmaProvider.updateEditMode();
                // Show updated
                Navigator.popAndPushNamed(context, 'NoteView');
              } else {
                noteViewModel.writeToHiveProvider(
                  SigmaNote(
                    title: _titleController.text,
                    dateCreated: dateTime,
                    noteType: NoteType.note,
                    noteBody: _noteBodyController.text,
                  ),
                );
                Navigator.pop(context);
              }
            },
            kIcon: Icons.save,
            kIconColor: Colors.white,
            kBackgroundColor: Colors.white.withOpacity(0.12),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
}
