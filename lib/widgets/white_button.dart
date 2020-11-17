// import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/colors.dart';

class WhiteButton extends StatelessWidget {
  final IconData kIcon;
  final double kSize;

  WhiteButton({this.kIcon, this.kSize = 24.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kIcon == Icons.menu) {
          Navigator.pushNamed(context, 'Info');
        } else {
          Navigator.pop(context);
        }
      },
      child: Container(
        height: 56.0,
        width: 56.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.3),
          //     offset: Offset(0.0, 48.0),
          //     blurRadius: 32.0,
          //   ),
          // ],
        ),
        child: Icon(
          kIcon,
          size: kSize,
          color: AppColor.darkGrey,
          semanticLabel: 'Info',
        ),
      ),
    );
  }
}
