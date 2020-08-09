import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../components/custom_clip_shadow.dart';

class NotableHeader extends StatelessWidget {
  NotableHeader({
    @required this.paddingTop,
  });

  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return CustomClipShadow(
      shadow: Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 2.0,
      ),
      clipper: HeaderClipper(paddingTop),
      child: Container(
        height: paddingTop + 56.0,
        width: 168.0,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
            left: 16.0, top: paddingTop),
        color: AppColor.primaryColor,
        child: Text(
          'NOTABLE',
          style: TextStyle(
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
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  final double topPadding;

  HeaderClipper(this.topPadding);

  @override
  Path getClip(Size size) {
    var _verticalHeight = topPadding + 56.0;
    var path = Path();

    path.lineTo(0.0, _verticalHeight);
    path.lineTo(136.0, _verticalHeight);
    path.lineTo(168.0, topPadding + 16.0);
    path.lineTo(168.0, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldDelegate) => false;
}

// class NotableHeader extends SliverPersistentHeaderDelegate {
//   NotableHeader({this.maxHeight, this.minHeight});

//   final double minHeight;
//   final double maxHeight;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return NotableAppBar();
//   }

//   @override
//   double get maxExtent => maxHeight;

//   @override
//   double get minExtent => minHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }