import 'package:flutter/material.dart';

import '../models/sigma_note.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  bool isTodoCollapsed = false;
  List<TodoItemModel> _itemList = [
    TodoItemModel(
      todoItem: 'Soap',
      isDone: true,
    ),
    TodoItemModel(
      todoItem: 'Brush',
      isDone: false,
    ),
    TodoItemModel(
      todoItem: 'Detergent',
      isDone: false,
    ),
    TodoItemModel(
      todoItem: 'Toothpaste',
      isDone: false,
    ),
  ];
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
                  'Todo',
                  style: Theme.of(context).textTheme.headline5,
                ),
                InkWell(
                  splashColor: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {
                    //TODO
                    setState(() {
                      if (isTodoCollapsed) {
                        isTodoCollapsed = false;
                      } else {
                        isTodoCollapsed = true;
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
            isTodoCollapsed
                ? Container()
                : Column(
                    children: [
                      // >>> Body
                      Container(
                        alignment: Alignment.topLeft,
                        height: 260.0,
                        // color: Colors.red,
                        child: ListView.builder(
                          // padding: EdgeInsets.symmetric(vertical: 16.0),
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: Colors.white,
                                onTap: () {
                                  //TODO
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 16.0),
                                    // color: Colors.green,
                                    child: Text(
                                      _itemList[index].todoItem,
                                      style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16.0,decoration: _itemList[index].isDone ? TextDecoration.lineThrough : null,),
                                    ),),
                              );
                            },
                            itemCount: _itemList.length),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      // >>> Date Created
                      Container(
                        alignment: Alignment.centerLeft,
                        // color: Colors.green,
                        child: Text(
                          '23 December, 2020',
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
}
