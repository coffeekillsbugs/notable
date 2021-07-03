import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/sigma_note.dart';

class HiveProvider extends ChangeNotifier {

  Box<SigmaNote> _sigmaNoteBox = Hive.box<SigmaNote>('sigmaNotes');

  Box<SigmaNote> get sigmaNoteBox => _sigmaNoteBox;

  SigmaNote? readFromHive(int index) {
      SigmaNote? readObject = _sigmaNoteBox.getAt(index);

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

  Iterable<SigmaNote> allNotes() =>
    _sigmaNoteBox.values;

  NoteType? noteType(int index) => _sigmaNoteBox.values.elementAt(index).noteType;

  void changeTodoItemState(SigmaNote changeObject, int index) {
    int objectIndex;

    // temp  = _sigmaNoteBox.values.where((element) => element.dateCreated == dateCreated);
    objectIndex = _sigmaNoteBox.values.toList().indexOf(changeObject);

    changeObject.todoItems![index].isDone = !changeObject.todoItems![index].isDone!;

    updateInHive(objectIndex, changeObject);

  }
}