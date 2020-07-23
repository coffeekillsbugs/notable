import 'package:flutter/material.dart';

import '../configs/colors.dart';

class TextStyling extends StatelessWidget {
  const TextStyling({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColor.secondaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(0.0, 3.0),
            blurRadius: 4.0,
          )
        ],
      ),
      
    );
  }
}