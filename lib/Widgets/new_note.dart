import 'package:flutter/material.dart';
import 'package:notes/Constants/colors.dart';

class NoteLayout extends StatelessWidget {
  final screenSize, variableHeight;

  NoteLayout({this.screenSize, this.variableHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
            color: carribeanGreen, borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: EdgeInsets.only(bottom: 3.0),
          child: Container(
            // height: 200.0,
            //width: screenSize.width * 0.45,
            decoration: BoxDecoration(
              color: outerSpace,
              borderRadius: BorderRadius.circular(10.0),
              // boxShadow: [
              //   BoxShadow(
              //     color: carribeanGreen,
              //     offset: Offset(0, 3),
              //     blurRadius: 1.0,
              //   ),
              // ],
            ),
          ),
        ),
      ),
    );
  }
}
