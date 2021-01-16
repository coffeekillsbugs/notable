import 'package:flutter/material.dart';

import '../models/sigma_note.dart';

class CompactNoteView extends StatefulWidget {
  final SigmaNote noteObject;

  CompactNoteView({
    @required this.noteObject,
  });

  @override
  _CompactNoteViewState createState() => _CompactNoteViewState();
}

class _CompactNoteViewState extends State<CompactNoteView> {
  bool isNoteCollapsed = true;
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
                Container(
                  child: Text(
                    widget.noteObject.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                InkWell(
                  splashColor: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {
                    setState(() {
                      if (isNoteCollapsed) {
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
                      isNoteCollapsed ? Icons.watch_later : Icons.watch_later_outlined,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
            isNoteCollapsed
                ? Container()
                : Column(
                    children: [
                      SizedBox(
                        height: 8.0,
                      ),
                      // >>> Body
                      Container(
                        alignment: Alignment.topLeft,
                        height: 160.0,
                        // color: Colors.red,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Text(
                            widget.noteObject.noteBody,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      // >>> Date Created
                      Container(
                        alignment: Alignment.centerLeft,
                        // color: Colors.green,
                        child: Text(
                          dateFormat(widget.noteObject.dateCreated),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  String dateFormat(DateTime dateTime) {
    String _dateTime;

    _dateTime = '${dateTime.day} ${monthName(dateTime.month)}, ${dateTime.year}';

    return _dateTime;
  }

  String monthName(int month) {
    switch (month) {
      case 1:
        return 'January';

      case 2:
        return 'February';

      case 3:
        return 'March';

      case 4:
        return 'April';

      case 5:
        return 'May';

      case 6:
        return 'June';

      case 7:
        return 'July';

      case 8:
        return 'August';

      case 9:
        return 'September';

      case 10:
        return 'October';

      case 11:
        return 'November';

      case 12:
        return 'December';

      default:
        return 'January';
    }
  }
}
