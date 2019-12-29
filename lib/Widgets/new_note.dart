import 'package:flutter/material.dart';
import 'package:notes/Constants/colors.dart';
import 'package:notes/Constants/lists.dart';

class NoteLayout extends StatelessWidget {
  final screenSize, variableHeight;

  NoteLayout({this.screenSize, this.variableHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: notes[0].color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    notes[0].title,
                    //textScaleFactor: 1.0,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.0,left: 2.0, right: 2.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: outerSpace,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        notes[0].body,
                        //textScaleFactor: 1.0,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
