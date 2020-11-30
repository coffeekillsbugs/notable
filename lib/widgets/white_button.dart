// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';
import '../sigma_provider.dart';

class WhiteButton extends StatelessWidget {
  final IconData kIcon;
  final double kSize;

  WhiteButton({this.kIcon, this.kSize = 24.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kIcon == Icons.add) {
          // Navigator.pushNamed(context, 'Info');
          Provider.of<SigmaProvider>(context, listen: false).changeTodoPadding();
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
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0,
            ),
          ],
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
