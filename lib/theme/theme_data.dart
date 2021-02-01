import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/textTheme.dart';

ThemeData sigmaTheme = ThemeData(
  accentColor: Colors.white,
  brightness: Brightness.dark,
  cursorColor: Colors.white,
  dialogBackgroundColor: AppColor.overlayFive,
  hintColor: Colors.white60,
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: AppColor.darkGrey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
  ),
  dialogTheme: DialogTheme().copyWith(
    contentTextStyle: sigmaTextTheme.subtitle2,
  ),
  primaryColor: AppColor.darkGrey,
  scaffoldBackgroundColor: AppColor.darkGrey,
  textSelectionColor: AppColor.darkGrey,
  textSelectionHandleColor: Colors.white,
  textTheme: sigmaTextTheme,
);