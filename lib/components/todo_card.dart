import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../configs/colors.dart';
import '../components/todo_item.dart';
import '../models/todo_item_model.dart';

class TodoCard extends StatefulWidget {
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 280,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: AppColor.carribeanGreen,
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
                color: AppColor.charlestonGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0.0, 3.0),
                    blurRadius: 10.0,
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
                        'Heading',
                        style: TextStyle(
                          color: AppColor.carribeanGreen,
                          fontSize: 20.0,
                          fontFamily: 'Merriweather',
                        ),
                      ),
                      Text(
                        '12th April, 2019',
                        style: TextStyle(
                          color: AppColor.carribeanGreen.withAlpha(150),
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
                          color: AppColor.carribeanGreen,
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
                          color: AppColor.carribeanGreen,
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
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10.0),
                itemCount: todoItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return TodoItem(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


