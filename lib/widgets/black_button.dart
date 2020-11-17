// import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/colors.dart';

class BlackButton extends StatelessWidget {
  final IconData kIcon;
  final double kSize;

  BlackButton({this.kIcon, this.kSize = 24.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kIcon == Icons.edit) {
          Navigator.pushNamed(context, 'NewNote');
        } else if (kIcon == Icons.check_box_outline_blank_rounded) {
          Navigator.pushNamed(context, 'NewTodo');
        } 
      },
      child: Container(
        height: 56.0,
        width: 56.0,
        decoration: BoxDecoration(
          color: AppColor.darkGrey,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Container(
        //   height: 24.0,
        // width: 24.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(5.0),
        ),
          child: Icon(
            kIcon,
            size: kSize,
            color: Colors.white,
            // semanticLabel: 'Info',
          ),
        ),
      ),
    );
  }
}
