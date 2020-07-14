import 'package:flutter/material.dart';
import 'package:notes/configs/colors.dart';

class NewTodo extends StatefulWidget {
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gunMetal,
      body: Center(
        child: Text(
          'NewTodo',
          style: TextStyle(color: AppColor.carribeanGreen),
        ),
      ),
    );
  }
}
