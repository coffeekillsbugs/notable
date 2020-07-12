import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:notes/configs/constants.dart';
import 'package:notes/constants/colors.dart';

class BottomFloater extends StatefulWidget {
  @override
  _BottomFloaterState createState() => _BottomFloaterState();
}

class _BottomFloaterState extends State<BottomFloater> {
  TextEditingController _searchController;
  PageController _buttonController;
  int _currentPage = 0;
  bool _hasText = false;
  Duration _duration = Duration(milliseconds: 200);
  Duration _duration2 = Duration(milliseconds: 400);
  bool _showNoteType = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _buttonController = PageController(initialPage: 0, keepPage: false);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          AnimatedOpacity(
            opacity: _showNoteType ? 1.0 : 0.0,
            duration: _duration2,
            child: SquareButton(index: 1),
          ),
          SizedBox(height: 10.0),
          AnimatedOpacity(
            opacity: _showNoteType ? 1.0 : 0.0,
            duration: _duration,
            child: SquareButton(index: 0),
          ),
          SizedBox(height: 10.0),
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
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller: _searchController,
                          cursorColor: AppColor.carribeanGreen,
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
                    },
                    controller: _buttonController,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Icon(
                        Feather.plus,
                        color: AppColor.charlestonGreen,
                        size: 30.0,
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
                    setState(() {
                      _showNoteType = !_showNoteType;
                    });
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
}

class SquareButton extends StatelessWidget {
  final index;

  SquareButton({this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          alignment: Alignment.center,
          height: 60.0,
          width: 60.0,
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
          child: Icon(
            index == 0 ? AntDesign.edit : MaterialCommunityIcons.checkbox_marked_outline,
            color: AppColor.carribeanGreen,
            size: 25.0,
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, index == 0 ? 'newNote' : 'newTodo');
        });
  }
}
