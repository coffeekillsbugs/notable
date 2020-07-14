import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'colors.dart';
import '../models/color_choice.dart';

List<IconData> squareButton = [
  Feather.plus,
  AntDesign.setting,
  AntDesign.edit,
  MaterialCommunityIcons.checkbox_marked_outline,
];

List <ColorName> colorNames = [
  ColorName(
    colorName: 'Caribbean Green',
    textColor: AppColor.almostWhite,
  ),
  ColorName(
    colorName: 'Harvard Crimson',
    textColor: AppColor.almostWhite,
  ),
  ColorName(
    colorName: 'Red Crayola',
    textColor: AppColor.almostWhite,
  ),
  ColorName(
    colorName: 'Mint Green',
    textColor: AppColor.gunMetal,
  ),
  ColorName(
    colorName: 'Sunset Orange',
    textColor: AppColor.almostWhite,
  ),
  ColorName(
    colorName: 'Lemon Yellow',
    textColor: AppColor.gunMetal,
  ),
  ColorName(
    colorName: 'Red',
    textColor: AppColor.almostWhite,
  ),
  ColorName(
    colorName: 'Amazonite',
    textColor: AppColor.almostWhite,
  ),
  ColorName(
    colorName: 'Magenta Process',
    textColor: AppColor.almostWhite,
  ),
  ColorName(
    colorName: 'Red Violet',
    textColor: AppColor.almostWhite,
  ),
];

List <ColorsChoice> colorsChoice = [
  ColorsChoice(color: AppColor.carribeanGreen),
  ColorsChoice(color: AppColor.harvardCrimson),
  ColorsChoice(color: AppColor.redCrayola),
  ColorsChoice(color: AppColor.mintGreen),
  ColorsChoice(color: AppColor.sunsetOrange),
  ColorsChoice(color: AppColor.lemonYellow),
  ColorsChoice(color: AppColor.red),
  ColorsChoice(color: AppColor.amazonite),
  ColorsChoice(color: AppColor.magentaProcess),
  ColorsChoice(color: AppColor.redViolet),
];