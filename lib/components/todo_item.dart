import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:notes/configs/colors.dart';
import 'package:notes/models/todo_item_model.dart';

class TodoItem extends StatelessWidget {

  final index;

  TodoItem({this.index});

  @override
  Widget build(BuildContext context) {
    
    var _width = MediaQuery.of(context).size.width - 90;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: _width,
            child: Text(
              todoItem[index].text,
              style: TextStyle(
                color: AppColor.outerSpace,
                fontSize: 25.0,
                fontFamily: 'SourceSansPro',
                decoration: todoItem[index].isDone ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('tapped checkbox');
              //TODO checkbox
            },
            child: Icon(
              todoItem[index].isDone ? MaterialCommunityIcons.checkbox_marked_outline : MaterialIcons.check_box_outline_blank,
              color: AppColor.outerSpace,
              size: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}