import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:notes/configs/colors.dart';
import 'package:notes/providers/note_provider.dart';
import 'package:provider/provider.dart';

class NoteOptions extends StatelessWidget {
final _position;

NoteOptions(this._position);
  @override
  Widget build(BuildContext context) {
    final _noteProvider = Provider.of<NoteProvider>(context, listen: false);
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
                _noteProvider.updatePosition(_position);
                _noteProvider.updateMode(true);
                Navigator.pushNamed(context, 'newNote');
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