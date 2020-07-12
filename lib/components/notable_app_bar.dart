import 'package:flutter/material.dart';
import 'package:notes/constants/colors.dart';

class NotableAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: double.infinity,
      color: AppColor.gunMetal,
      child: SafeArea(
        child: Text(
          'NOTABLE',
          style: TextStyle(
            color: AppColor.carribeanGreen,
            fontSize: 30.0,
            fontFamily: 'Righteous',
          ),
        ),
      ),
    );
  }
}