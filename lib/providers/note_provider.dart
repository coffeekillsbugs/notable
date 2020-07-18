import 'package:flutter/material.dart';

import '../Models/note.dart';
import '../configs/colors.dart';
import '../Models/todo_item_model.dart';

class NoteProvider with ChangeNotifier {
  bool _isNewNoteActive = false;
  bool _isEditMode = false;

  Color _flavour = AppColor.carribeanGreen;

  List<TodoItemModel> _todoListBuffer = List();
  List<Note> _noteList = noteList;

  int _position;
  //bool _showNewTodo = false;

  bool get showNoteType => _isNewNoteActive;

  Color get flavour => _flavour;

  List<TodoItemModel> get itemList => _todoListBuffer;

  bool get isEditMode => _isEditMode;

  // Whether to show FABs for New Note and New Todo
  void changeStatus(bool data) {
    _isNewNoteActive = data;
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

  void updateMode(bool status) {
    _isEditMode = status;
    notifyListeners();
  }

  void updatePosition(int position) {
    _position = position;
    notifyListeners();
  }

  SimpleNote noteBody() {
    SimpleNote _simpleNote = noteList[_position];
    return _simpleNote;
  }
}
