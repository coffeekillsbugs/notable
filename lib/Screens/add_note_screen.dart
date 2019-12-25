import 'package:flutter/material.dart';
import 'package:notes/Constants/colors.dart';
import 'package:notes/Models/note.dart';

class NewNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: smokyBlack,
            body: Container(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: outerSpace,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  disabledBorder: null,
                                  enabledBorder: null,
                                  focusedBorder: null,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: gunMetal,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextField()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
