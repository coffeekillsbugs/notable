import 'dart:ui' as ui;

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
      backgroundColor: AppColor.primaryColor,
      // appBar: PreferredSize(
      //   child: NotableAppBar(),
      //   preferredSize: Size.fromHeight(80.0),
      // ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Container(
            //   child: ListView.builder(
            //     padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
            //     physics: BouncingScrollPhysics(),
            //     itemCount: noteList.length,
            //     itemBuilder: (context, index) => noteList[index].noteType == NoteType.SimpleNote ? NoteCard(index) : TodoCard(index),
            //   ),
            // ),
            // CustomScrollView(
            //   physics: BouncingScrollPhysics(),
            //   slivers: <Widget>[
            //     SliverPersistentHeader(
            //       delegate: NotableHeader(
            //         maxHeight: 72.0,
            //         minHeight: 72.0,
            //       ),
            //       pinned: true,
            //     ),
            //     SliverList(
            //       delegate: SliverChildBuilderDelegate(
            //         (context, index) => Padding(
            //           padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0,
            //               index == noteList.length - 1 ? 88.0 : 0.0),
            //           child: noteList[index].noteType == NoteType.SimpleNote
            //               ? NoteCard(index)
            //               : TodoCard(index),
            //         ),
            //         childCount: noteList.length,
            //       ),
            //     ),
            //   ],
            // ),
            NestedScrollView(
              headerSliverBuilder: (context, boxIsScrolled) {
                return <Widget>[
                  SliverPersistentHeader(
                    delegate: NotableHeader(
                      maxHeight: 72.0,
                      minHeight: 72.0,
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: Container(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
                  physics: BouncingScrollPhysics(),
                  itemCount: noteList.length,
                  itemBuilder: (context, index) =>
                      noteList[index].noteType == NoteType.SimpleNote
                          ? NoteCard(index)
                          : TodoCard(index),
                ),
              ),
            ),
            BottomFloater(),
          ],
        ),
      ),
    );
  }
}
