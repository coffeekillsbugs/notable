import 'package:flutter/material.dart';

import '../theme/colors.dart';

class NoteButton extends StatelessWidget {
  final IconData kIcon;
  final String kLabel;
  final Function? kOnTap;

  NoteButton({
    required this.kIcon,
    required this.kLabel,
    this.kOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: kOnTap as void Function()?,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
                // spreadRadius: 1.0,
              ),
            ],
          ),
          child: Container(
            height: 200.0,
            decoration: BoxDecoration(
              color: AppColor.overlayEight,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  kIcon,
                  color: Colors.white,
                  size: 40.0,
                ),
                SizedBox(height: 8.0),
                Text(
                  kLabel,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}