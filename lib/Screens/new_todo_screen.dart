import 'package:flutter/material.dart';
import 'package:notes/providers/note_provider.dart';
import 'package:provider/provider.dart';

import '../configs/colors.dart';
import '../components/footer_actions.dart';
import '../components/todo_screen/todo_app_bar.dart';
import '../components/todo_screen/todo_body.dart';

class NewTodoScreen extends StatefulWidget {
  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    // var _flavour = Provider.of<FlagProvider>(context).flavour;
    var _padding = MediaQuery.of(context).padding.top;
    var _height = MediaQuery.of(context).size.height - _padding;
    var _itemList = Provider.of<NoteProvider>(context).itemList;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Container(
          height: _height - 32.0,
          margin: EdgeInsets.all(16.0),
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.end,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Padding(
                padding:EdgeInsets.only(bottom: 68.0),
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    // Todo Title >>>--------------------->#
                    SliverPersistentHeader(
                      delegate: TodoHeader(maxHeight: 60.0, minHeight: 60.0),
                      floating: true,
                      pinned: false,
                    ),
                    // Todo List >>>--------------------->#
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => TodoBody(index),
                        childCount: _itemList.length,
                      ),
                    ),
                    //TodoBody(_padding),
                  ],
                ),
              ),
              // Todo Adder >>>------------------------>#
              AddItem(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        child: FooterActions(),
      ),
    );
  }
}
