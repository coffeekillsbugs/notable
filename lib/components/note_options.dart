import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:notes/constants/colors.dart';

class NoteOptions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print('tapped edit');
                //TODO edit note
              },
              child: Icon(
                MaterialIcons.edit,
                color: AppColor.gunMetal,
                size: 25.0,
              ),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                print('tapped delete');
                //TODO delete note
              },
              child: Icon(
                MaterialIcons.delete,
                color: AppColor.gunMetal,
                size: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}