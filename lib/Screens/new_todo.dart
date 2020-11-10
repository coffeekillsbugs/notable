import 'package:flutter/material.dart';
import 'package:sigma/widgets/fab_blur.dart';

import '../widgets/gradient_background.dart';

class NewTodoScreen extends StatefulWidget {
  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {

  // FocusNode _description;

  // @override
  // void initState() {
  //   super.initState();

  //   _description = FocusNode();
  // }

  // @override
  // void dispose() {
  //   _description.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 32.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    // color: Colors.white,
                    child: TextField(
                      autofocus: true,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context).textTheme.headline3,
                      cursorColor: Colors.white,
                      cursorRadius: Radius.circular(10.0),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white60),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    color: Colors.white,
                    //TODO implement todo list item addition method
                  ),
                  SizedBox(height: 100.0),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButtonBlur(Icons.chevron_left_rounded),
                SizedBox(width: 16.0),
                FloatingActionButtonBlur(Icons.save),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
