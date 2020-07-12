import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:notes/components/bottom_floater.dart';
import 'package:notes/components/notable_app_bar.dart';
import 'package:notes/components/note_card.dart';
import 'package:notes/components/todo_card.dart';
import 'package:notes/constants/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.gunMetal,
      appBar: PreferredSize(
        child: NotableAppBar(),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            child: ListView(
              padding: EdgeInsets.only(top: 5.0, bottom: 80.0, left: 10.0, right: 10.0),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                NoteCard(),
                // NoteCard(),
                // NoteCard(),
                // NoteCard(),
                // NoteCard(),
                TodoCard(),
              ],
            ),
          ),
          BottomFloater(),
        ],
      ),
    );
  }
}




