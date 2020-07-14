import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlagProvider with ChangeNotifier {
  bool _showNoteType = false;
  //bool _showNewTodo = false;

  bool get showNoteType => _showNoteType;

  void changeStatus(bool data) {
    _showNoteType = data;
    notifyListeners();
  }
}