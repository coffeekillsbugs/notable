import 'package:flutter/material.dart';

class NoteView extends StatefulWidget {
  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  bool isNoteCollapsed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            // >>> Title, Collapse and Expand button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Note',
                  style: Theme.of(context).textTheme.headline5,
                ),
                InkWell(
                  splashColor: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {
                    setState(() {
                      if(isNoteCollapsed) {
                        isNoteCollapsed = false;
                      } else {
                        isNoteCollapsed = true;
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Icon(
                      Icons.watch_later,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
            isNoteCollapsed ? Container() : Column(
              children: [
                SizedBox(height: 8.0,),
                // >>> Body
                Container(
                  alignment: Alignment.topLeft,
                  height: 160.0,
                  // color: Colors.red,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Text('This is note body.', style: Theme.of(context).textTheme.bodyText1,),),
                ),
                SizedBox(height: 8.0,),
                // >>> Date Created
                Container(
                  alignment: Alignment.centerLeft,
                  // color: Colors.green,
                  child: Text('23 December, 2020', style: Theme.of(context).textTheme.bodyText2,),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
