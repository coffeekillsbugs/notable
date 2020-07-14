import 'package:flutter/material.dart';
import 'package:notes/configs/colors.dart';

class FlagProvider with ChangeNotifier {
  bool _showNoteType = false;
  Color _flavour = AppColor.carribeanGreen;
  //bool _showNewTodo = false;

  bool get showNoteType => _showNoteType;

  Color get flavour => _flavour;

  void changeStatus(bool data) {
    _showNoteType = data;
    notifyListeners();
  }

  void changeColor(Color changeColor) {
    _flavour = changeColor;
    notifyListeners();
  }
}