import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../components/note_body.dart';
import '../components/text_styling.dart';
import '../components/footer_actions.dart';

class NewNote extends StatefulWidget {
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  
  @override
  Widget build(BuildContext context) {
    var _padding = MediaQuery.of(context).padding.top;
    //var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.gunMetal,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                NoteBody(_padding),
                SizedBox(height: 10.0),
                TextStyling(),
                SizedBox(height: 10.0),
                FooterActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




