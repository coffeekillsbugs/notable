import 'package:flutter/material.dart';

import '../configs/colors.dart';

class TextStyling extends StatelessWidget {
  const TextStyling({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColor.charlestonGreen,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.3),
        //     offset: Offset(0.0, 3.0),
        //     blurRadius: 5.0,
        //   )
        // ],
      ),
    );
  }
}