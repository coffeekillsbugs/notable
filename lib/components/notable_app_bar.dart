import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:notes/configs/colors.dart';

class NotableAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: double.infinity,
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Text(
          'NOTABLE',
          style: TextStyle(
            //color: AppColor.carribeanGreen,
            fontSize: 30.0,
            fontFamily: 'Righteous',
            foreground: Paint()
              ..shader = ui.Gradient.linear(
                Offset(0, 20),
                Offset(150, 20),
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
