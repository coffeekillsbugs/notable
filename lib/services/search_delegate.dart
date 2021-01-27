import 'package:flutter/material.dart';

import '../repository/hive_provider.dart';
import '../models/sigma_note.dart';
import '../views/compact_note_view.dart';
import '../views/compact_todo_view.dart';
import '../theme/colors.dart';

class NoteSearch extends SearchDelegate<int> {
  final textStyle;

  NoteSearch(this.textStyle);

  @override
  TextStyle get searchFieldStyle => textStyle;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.keyboard_arrow_left_rounded,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    HiveProvider hiveProvider = HiveProvider();
    var allNotes = hiveProvider.allNotes().where((a) => a.title.toLowerCase().contains(query));

    if (allNotes.isEmpty) {
      return Text('Nothing to show');
    }

    return ListView(
      physics: BouncingScrollPhysics(),
      children: allNotes
          .map<GestureDetector>(
            (a) => GestureDetector(
          onTap: () {
            close(context, hiveProvider.allNotes().toList().indexOf(a));
          },
          child: a.noteType == NoteType.note ? CompactNoteView(noteObject: a) : CompactTodoView(todoObject: a),
        ),
      )
          .toList(),
      padding: EdgeInsets.symmetric(vertical: 8.0),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    HiveProvider hiveProvider = HiveProvider();
    var allNotes = hiveProvider.allNotes().where((a) => a.title.toLowerCase().contains(query));

    if (allNotes.isEmpty) {
      return Text('Nothing to show');
    }

    return ListView(
      physics: BouncingScrollPhysics(),
      children: allNotes
          .map<Padding>(
            (a) => Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: GestureDetector(
            onTap: () {
              close(context, hiveProvider.allNotes().toList().indexOf(a));
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColor.overlaySeven,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                children: [
                  Icon(a.noteType == NoteType.note ? Icons.edit : Icons.check_box_rounded, color: Colors.white),
                  SizedBox(width: 16.0),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Text(
                      a.title,
                      style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
          .toList(),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    );
  }
}