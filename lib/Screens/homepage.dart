import 'package:flutter/material.dart';
import 'package:notes/Models/note.dart';

import '../configs/colors.dart';
import '../components/note_card.dart';
import '../components/todo_card.dart';
import '../components/bottom_floater.dart';
import '../components/notable_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              padding: EdgeInsets.only(
                  top: 5.0, bottom: 80.0, left: 10.0, right: 10.0),
              physics: BouncingScrollPhysics(),
              itemCount: noteList.length,
              itemBuilder: (context, index) => noteList[index].noteType == NoteType.SimpleNote ? NoteCard(index) : TodoCard(index),
            ),
          ),
          BottomFloater(),
        ],
      ),
    );
  }
}

