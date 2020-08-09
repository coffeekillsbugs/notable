import 'package:flutter/material.dart';

class CustomClipShadow extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  CustomClipShadow({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowPainter(shadow: this.shadow, clipper: this.clipper),
      child: ClipPath(
        clipper: this.clipper,
        child: this.child,
      ),
    );
    
  }
}

class _ClipShadowPainter extends CustomPainter {

  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paintShadow = shadow.toPaint();
    var path = clipper.getClip(size).shift(shadow.offset);

    canvas.drawPath(path, paintShadow);
  }

  @override
  bool shouldRepaint(CustomPainter oldPainter) => true;
}
