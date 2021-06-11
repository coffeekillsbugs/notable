import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SigmaButton extends StatelessWidget {
  final IconData kIcon;
  final double kSize;
  final Function? kOnPressed;
  final Color? kBackgroundColor;
  final Color kIconColor;
  final String kHeroTag;

  SigmaButton({
    required this.kIcon,
    this.kSize = 24.0,
    this.kOnPressed,
    this.kBackgroundColor,
    this.kIconColor = AppColor.darkGrey,
    required this.kHeroTag,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      width: 56.0,
      child: FloatingActionButton(
        heroTag: kHeroTag,
        onPressed: kOnPressed as void Function()?,
        child: Icon(
          kIcon,
          size: kSize,
          color: kIconColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: kBackgroundColor ?? Theme.of(context).accentColor,
      ),
    );
  }
}
