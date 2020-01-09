import 'package:flutter/material.dart';
import 'package:notes/Constants/colors.dart';
import 'package:notes/Constants/lists.dart';

class NoteLayout extends StatelessWidget {

  final int index;

  NoteLayout({this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: notes[index].color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 4.0,left: 2.0, right: 2.0),
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
                    color: isabelline,//notes[index].color,
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


// Text(
//                     notes[index].title,
//                     //textScaleFactor: 1.0,
//                     textAlign: TextAlign.left,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 15.0,
//                       color: smokyBlack,
//                     ),
//                   ),