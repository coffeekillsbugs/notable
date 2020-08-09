// import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../configs/colors.dart';
// import '../components/note_card.dart';
// import '../components/todo_card.dart';
// import '../components/bottom_floater.dart';
import '../components/notable_app_bar.dart';
import '../components/controller_halo.dart';
// import '../components/custom_clip_shadow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var _width = MediaQuery.of(context).size.width;
    var _paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        children: <Widget>[
          // [App Bar] >>>-------------------->
          NotableHeader(paddingTop: _paddingTop),
          // [Status Bar Box] >>>---------------->
          StatusBarBackground(paddingTop: _paddingTop),
          // [Bottom Button] >>>------------------>
          ControllerHalo(),
        ],
      ),
    );
  }
}



class StatusBarBackground extends StatelessWidget {
  StatusBarBackground({
    @required this.paddingTop,
  });

  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: paddingTop,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0.0, 2.0),
            blurRadius: 8.0,
          ),
        ],
      ),
    );
  }
}






