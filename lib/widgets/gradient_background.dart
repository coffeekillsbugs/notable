import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/colors.dart';

class GradientBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomRight,
          colors: [
            AppColor.deepBlue,
            AppColor.aquaBlue,
          ],
          stops: [
            0.0,
            1.0,
          ],
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0),
        ),
      ),
    );
  }
}