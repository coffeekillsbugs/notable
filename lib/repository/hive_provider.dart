import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:sigma/models/sigma_note.dart';

class HiveProvider extends ChangeNotifier {
  Box<SigmaNote> _sigmaNoteBox = Hive.box<SigmaNote>('sigmaNotes');

  Box<SigmaNote> get sigmaNoteBox => _sigmaNoteBox;

  SigmaNote readFromHive(int index) {
    SigmaNote readObject = _sigmaNoteBox.getAt(index)!;
    return readObject;
  }

  void writeToHive(SigmaNote writeObject) {
    _sigmaNoteBox.add(writeObject);
  }

  void updateInHive(int index, SigmaNote updateObject) {
    _sigmaNoteBox.putAt(index, updateObject);
  }

  void deleteInHive(int index) {
    _sigmaNoteBox.deleteAt(index);
  }

  Iterable<SigmaNote> allNotes() => _sigmaNoteBox.values;

  NoteType getNoteType(int index) => _sigmaNoteBox.values.elementAt(index).noteType;

  void changeTodoItemState(DateTime dateCreated, int todoItemIndex) {

    SigmaNote changeObject = _sigmaNoteBox.values.singleWhere((element) => element.dateCreated == dateCreated);
    // var temp = _sigmaNoteBox.values.where((element) => element.dateCreated == dateCreated);
    int objectIndex = _sigmaNoteBox.values.toList().indexOf(changeObject);

    changeObject.todoItems![todoItemIndex].isDone = !changeObject.todoItems![todoItemIndex].isDone;

    updateInHive(objectIndex, changeObject);
  }
}
