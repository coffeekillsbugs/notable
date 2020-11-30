import 'package:flutter/material.dart';

class SigmaProvider extends ChangeNotifier {
bool _isFABCollapsed = true;

get isFABCollapsed => _isFABCollapsed;

void changeTodoPadding() {
  if (_isFABCollapsed == false) {
    _isFABCollapsed = true;
  } else {
    _isFABCollapsed = false;
  }

  print(_isFABCollapsed);

  notifyListeners();
}
}