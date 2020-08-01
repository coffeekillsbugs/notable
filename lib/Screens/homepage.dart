import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../components/note_card.dart';
import '../components/todo_card.dart';
import '../components/bottom_floater.dart';
import '../components/notable_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        children: <Widget>[
          CustomPaint(
            painter: Header(),
          ),
          // [Status Bar Box] >>>---------------->
          Container(
            width: _width,
            height: MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = AppColor.primaryColor;

    path.lineTo(0.0, 80.0);
    path.lineTo(100.0, 80.0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
