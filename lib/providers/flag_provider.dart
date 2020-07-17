import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../Models/todo_item_model.dart';

class FlagProvider with ChangeNotifier {
  bool _showNoteType = false;
  Color _flavour = AppColor.carribeanGreen;
  List<TodoItemModel> _todoListBuffer = List();
  //bool _showNewTodo = false;

  bool get showNoteType => _showNoteType;

  Color get flavour => _flavour;

  List<TodoItemModel> get itemList => _todoListBuffer;

  void changeStatus(bool data) {
    _showNoteType = data;
    notifyListeners();
  }

  void changeColor(Color changeColor) {
    _flavour = changeColor;
    notifyListeners();
  }

  void addItem(String text) {
    _todoListBuffer.add(TodoItemModel(text: text));
    notifyListeners();
  }
}