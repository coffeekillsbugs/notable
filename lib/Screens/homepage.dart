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
          // [App Bar] >>>-------------------->
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
                        Offset(50, 40),
                        Offset(50, 65),
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
                  color: Colors.black,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 8.0,
                ),
              ],
            ),
          ),
          // [Bottom Nav Bar] >>>------------------>
          CustomPaint(
            painter: Halo(),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  print('halo tapped');
                },
                child: Container(
                  height: 72.0,
                  width: 72.0,
                  color: Colors.transparent,
                ),
              ),
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

class Halo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //print(size);
    var _center = Offset(size.width - 36.0, size.height - 36.0);

    Paint background = Paint()
    ..color = AppColor.primaryColor;

    Paint backgroundShadow = Paint()
      ..color = Colors.black
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8.0);

    Path backgroundPath = Path();

    // Background Canvas
    backgroundPath.moveTo(size.width, size.height);
    backgroundPath.lineTo(size.width - 72.0, size.height);
    backgroundPath.lineTo(size.width - 72.0, size.height - 56.0);
    backgroundPath.lineTo(size.width - 56.0, size.height - 72.0);
    backgroundPath.lineTo(size.width, size.height - 72.0);
    backgroundPath.close();

    canvas.drawPath(backgroundPath, backgroundShadow);

    canvas.drawPath(backgroundPath, background);

    // Outer Circle Paint
    Paint paint = Paint()
      ..shader = ui.Gradient.radial(
        _center,
        18.0,
        [
          AppColor.brandViolet,
          AppColor.brandPink,
        ],
      );

    // Outer Circle Shadow
    Paint shadowPaint = Paint()
      ..color = AppColor.brandPink
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8.0);

    // Outer Circle Path
    Path path = Path()..addOval(Rect.fromCircle(center: _center, radius: 20.0));

    // Inner Circle Paint
    Paint paintInner = Paint()..color = AppColor.brandPink;

    // Inner Circle Shadow
    Paint shadowPaintInner = Paint()
      ..color = AppColor.primaryColor
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 4.0);
    
    // Inner Circle Path
    Path pathInner = Path()
      ..addOval(Rect.fromCircle(center: _center, radius: 12.0));

    // Outer Circle Shadow
    canvas.drawPath(path, shadowPaint);
    // Outer Circle Canvas
    canvas.drawPath(path, paint);

    // Inner Circle Canvas
    canvas.drawPath(pathInner, paintInner);
    // Inner Circle Shadow
    canvas.drawPath(pathInner, shadowPaintInner);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
