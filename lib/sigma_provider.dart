import 'package:flutter/material.dart';

class SigmaProvider extends ChangeNotifier {
  bool _isEditMode = false;
  int _selectedIndex;

  get isEditMode => _isEditMode;
  get selectedIndex => _selectedIndex;

  void updateEditMode() {
    if (_isEditMode) {
      _isEditMode = false;
    } else {
      _isEditMode = true;
    }

    notifyListeners();
  }

  void updateSelectedIndex(int index) {
    _selectedIndex = index;

    notifyListeners();
  }
}
