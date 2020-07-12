import 'package:flutter/material.dart';
import 'package:notes/constants/colors.dart';

class NewNote extends StatefulWidget {
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gunMetal,
      body: Center(
        child: Text(
          'NewNote',
          style: TextStyle(color: AppColor.carribeanGreen),
        ),
      ),
    );
  }
}
