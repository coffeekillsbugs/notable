import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../components/custom_clip_shadow.dart';

class ControllerHalo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: CustomClipShadow(
        shadow: Shadow(
          offset: Offset(-2.0, -2.0),
          blurRadius: 8.0,
        ),
        clipper: HaloClipper(),
        child: Container(
          height: 72.0,
          width: 72.0,
          color: AppColor.primaryColor,
          child: CustomPaint(
            painter: Halo(),
          ),
        ),
      ),
    );
  }
}

class Halo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    var _center = Offset(size.width - 36.0, size.height - 36.0);

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



class HaloClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(size.width - 72.0, size.height);
    path.lineTo(size.width - 72.0, size.height - 56.0);
    path.lineTo(size.width - 56.0, size.height - 72.0);
    path.lineTo(size.width, size.height - 72.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldDelegate) => false;
}