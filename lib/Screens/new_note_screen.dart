import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../components/note_body.dart';
import '../components/text_styling.dart';
import '../components/footer_actions.dart';

class NewNote extends StatefulWidget {
  // final _paddingTop;

  // NewNote(this._paddingTop);
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  
  @override
  Widget build(BuildContext context) {
    var _padding = MediaQuery.of(context).padding.top;
    //var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              NoteBody(),
              SizedBox(height: 16.0),
              TextStyling(),
              SizedBox(height: 16.0),
              FooterActions(),
            ],
          ),
        ),
      ),
    );
  }
}




