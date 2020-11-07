import 'package:flutter/material.dart';
import 'package:sigma/widgets/fab_blur.dart';

import '../widgets/gradient_background.dart';

class NewNoteScreen extends StatefulWidget {
  @override
  _NewNoteScreenState createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
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
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context).textTheme.headline3,
                      cursorColor: Colors.white,
                      cursorRadius: Radius.circular(10.0),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    // color: Colors.white,
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: Theme.of(context).textTheme.bodyText1,
                      cursorColor: Colors.white,
                      cursorRadius: Radius.circular(10.0),
                      cursorHeight: 20.0,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Whats on your mind?',
                        hintStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
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
