import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:notes/Models/note.dart';

import '../configs/colors.dart';
import '../components/todo_item.dart';
import '../models/todo_item_model.dart';

class TodoCard extends StatefulWidget {
  final int index;

  TodoCard(this.index);
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    final Color _flavour = noteList[widget.index].color;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 280.0,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: _flavour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              height: 60.0,
              width: double.infinity,
              decoration: ShapeDecoration(
                color: AppColor.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0.0, 3.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        noteList[widget.index].title,
                        style: TextStyle(
                          color: _flavour,
                          fontSize: 20.0,
                          fontFamily: 'Merriweather',
                        ),
                      ),
                      Text(
                        '12th April, 2019', //noteList[widget.index].dateTime.toString()
                        style: TextStyle(
                          color: _flavour.withAlpha(150),
                          fontSize: 14.0,
                          fontFamily: 'Merriweather',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print('tapped edit');
                          //TODO edit note
                        },
                        child: Icon(
                          MaterialIcons.edit,
                          color: _flavour,
                          size: 25.0,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          print('tapped delete');
                          //TODO delete note
                        },
                        child: Icon(
                          MaterialIcons.delete,
                          color: _flavour,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 210.0,
              decoration: ShapeDecoration(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ),
              // child: ListView.builder(
              //   shrinkWrap: true,
              //   physics: ClampingScrollPhysics(),
              //   padding: EdgeInsets.symmetric(vertical: 10.0),
              //   itemCount: todoItem.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return TodoItem(index: index);
              //   },
              // ),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => TodoItem(index: index),
                      childCount: todoItem.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
