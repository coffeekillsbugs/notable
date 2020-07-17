import 'package:flutter/material.dart';

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
    // var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.gunMetal,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: TodoAppBar(),
      ),
      body: TodoBody(_padding),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0),
        child: FooterActions(),
      ),
    );
  }
}






