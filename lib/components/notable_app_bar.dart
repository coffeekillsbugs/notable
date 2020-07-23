import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:notes/configs/colors.dart';

class NotableAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0,),
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(0.0, 3.0),
            blurRadius: 4.0,
          ),
        ],
      ),
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
