import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/colors.dart';

class FloatingActionButtonBlur extends StatelessWidget {
  final IconData kIcon;

  FloatingActionButtonBlur(this.kIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        // color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0.0, 48.0),
            blurRadius: 32.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: GestureDetector(
          onTap: () {
            if (kIcon == Icons.info_outline) {
              Navigator.pushNamed(context, 'Info');
            } else if (kIcon == Icons.edit) {
              Navigator.pushNamed(context, 'NewNote');
            } else if (kIcon == Icons.check_box_outline_blank_rounded) {
              Navigator.pushNamed(context, 'NewTodo');
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white54,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ),
              child: Container(
                child: Icon(
                  kIcon,
                  size: 24.0,
                  color: AppColor.deepBlue,
                  semanticLabel: 'Info',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}