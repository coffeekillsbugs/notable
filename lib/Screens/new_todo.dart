import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/white_button.dart';
import '../widgets/black_button.dart';

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
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
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
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.white60),
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
      floatingActionButton: Row(
        children: [
          WhiteButton(kIcon: Icons.chevron_left_rounded, kSize: 40.0),
          SizedBox(width: 16.0),
          BlackButton(kIcon: Icons.save),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
