import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes/components/new_note_button.dart';
import 'package:notes/components/new_todo_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../configs/colors.dart';
import '../providers/note_provider.dart';

class BottomFloater extends StatefulWidget {
  @override
  _BottomFloaterState createState() => _BottomFloaterState();
}

class _BottomFloaterState extends State<BottomFloater> with SingleTickerProviderStateMixin {
  GlobalKey<TodoButtonState> todo = GlobalKey<TodoButtonState>();
  GlobalKey<NoteButtonState> note = GlobalKey<NoteButtonState>();
  TextEditingController _searchController;
  PageController _buttonController;
  AnimationController _addController;
  Animation<double> _addAnimation;
  int _currentPage = 0;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _buttonController = PageController(initialPage: 0, keepPage: false);

    _addController = AnimationController(vsync: this, duration : Duration(milliseconds: 800));
    _addAnimation = Tween<double>(begin: 0.0, end: 3 * pi / 4).animate(
      CurvedAnimation(curve: Curves.elasticInOut, parent: _addController, reverseCurve: Curves.elasticInOut,),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _buttonController.dispose();

    _addController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _change = Provider.of<NoteProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TodoButton(
            key: todo,
            toggleVisibility: toggleVisibility,
          ),
          NoteButton(
            key: note,
            toggleVisibility: toggleVisibility,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                height: 60.0,
                width: MediaQuery.of(context).size.width - 90,
                decoration: BoxDecoration(
                  color: AppColor.charlestonGreen,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    // Search Box >>>---------------------->#
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller: _searchController,
                          cursorColor: AppColor.carribeanGreen,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: AppColor.carribeanGreen,
                              fontSize: 18.0,
                              fontFamily: 'Merriweather'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: AppColor.carribeanGreen.withAlpha(150),
                              fontSize: 18.0,
                              fontFamily: 'Merriweather',
                            ),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              if (value.isNotEmpty) {
                                _hasText = true;
                              } else
                                _hasText = false;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    _hasText
                        ? GestureDetector(
                            child: Container(
                              child: Icon(
                                AntDesign.close,
                                color: AppColor.carribeanGreen,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _searchController.text = '';
                                _hasText = false;
                              });
                            },
                          )
                        : Container(),
                  ],
                ),
              ),
              // Add Note and Settings >>>------------------>#
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color: AppColor.carribeanGreen,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(0.0, 3.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: PageView(
                    onPageChanged: (int value) {
                      _currentPage = value;
                      if (value == 1 && _change.showNoteType == true) {
                        toggleVisibility(_change);
                      }
                    },
                    controller: _buttonController,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: _addController,
                        builder: (context, child) => Transform.rotate(
                          angle: _addAnimation.value,
                          child: Icon(
                        Feather.plus,
                        color: AppColor.charlestonGreen,
                        size: 30.0,
                      ),
                        ),
                      ),
                      Icon(
                        AntDesign.setting,
                        color: AppColor.charlestonGreen,
                        size: 25.0,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  if (_currentPage == 0) {
                    toggleVisibility(_change);
                  } else {
                    Navigator.pushNamed(context, 'settings');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void toggleVisibility(var change) {
    change.changeStatus(!change.showNoteType);

    if (change.showNoteType == false) {
      _addController.reverse();
      note.currentState.noteController.reverse()
        ..whenCompleteOrCancel(() => todo.currentState.todoController.reverse());
    } else {
      _addController.forward();
      note.currentState.noteController.forward()
        ..whenCompleteOrCancel(() => todo.currentState.todoController.forward());
    }
  }
}


