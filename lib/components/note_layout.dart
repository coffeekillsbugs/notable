import 'package:flutter/material.dart';
import 'package:notes/theme/colors.dart';
import 'package:notes/models/lists.dart';

class NoteLayout extends StatelessWidget {

  final int index;

  NoteLayout({this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: notes[index].color,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Colors.black.withOpacity(0.7),
              offset: Offset(3.0, 4.0),
              spreadRadius: 0.3,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Container(
            decoration: BoxDecoration(
              color: charlestonGreen,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  notes[index].body,
                  //textScaleFactor: 1.0,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: almostWhite,//notes[index].color,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}