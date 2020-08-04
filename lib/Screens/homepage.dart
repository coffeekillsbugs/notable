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
            painter: Header(MediaQuery.of(context).padding.top),
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Container(
                //color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.0),
                height: 56.0,
                width: 168.0,
                child: Text(
                  'NOTABLE',
                  style: TextStyle(
                    //color: AppColor.carribeanGreen,
                    fontSize: 30.0,
                    fontFamily: 'Righteous',
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        Offset(0, 20),
                        Offset(150, 20),
                        <Color>[
                          AppColor.brandViolet,
                          AppColor.brandPink,
                        ],
                      ),
                  ),
                ),
              ),
            ),
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
  final _topPadding;

  Header(this._topPadding);

  @override
  void paint(Canvas canvas, Size size) {
    var _verticalHeight = _topPadding + 56.0;
    Paint paint = Paint();
    Paint shadowPaint = Paint()
    ..color = Colors.black
    ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4.0);
    Path path = Path();

    // print('size : $size');
    paint.color = AppColor.primaryColor;

    //Header path
    path.lineTo(0.0, _verticalHeight);
    path.lineTo(136.0, _verticalHeight);
    path.lineTo(168.0, _topPadding + 16.0);
    path.lineTo(168.0, 0.0);
    path.close();

    //Header shadow
    canvas.drawPath(path, shadowPaint);

    //Header canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
