import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SigmaButton extends StatelessWidget {
  final IconData kIcon;
  final double kSize;
  final double buttonSize;
  final Function kOnPressed;
  final Color kBackgroundColor;
  final Color kIconColor;
  final String kHeroTag;

  SigmaButton({
    @required this.kIcon,
    this.kSize = 32.0,
    this.buttonSize = 64.0,
    this.kOnPressed,
    this.kBackgroundColor,
    this.kIconColor = AppColor.darkGrey,
    @required this.kHeroTag,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonSize,
      width: buttonSize,
      child: FloatingActionButton(
        heroTag: kHeroTag,
        onPressed: kOnPressed,
        child: Transform.rotate(
          angle: 0.785,
          child: Icon(
            kIcon,
            size: kSize,
            color: kIconColor,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: kBackgroundColor ?? Theme.of(context).accentColor,
        // backgroundColor: Colors.white12,
      ),
    );
  }
}
