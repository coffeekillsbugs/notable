import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/sigma_note.dart';

class HiveProvider extends ChangeNotifier {

  Box<SigmaNote> _sigmaNoteBox = Hive.box<SigmaNote>('sigmaNotes');

  SigmaNote readFromHive(int index) {
      SigmaNote readObject = _sigmaNoteBox.getAt(index);

      return readObject;
  }

  void writeToHive(SigmaNote writeObject) {
      _sigmaNoteBox.add(writeObject);
  }

  void updateInHive(int index, SigmaNote updateObject) {
    _sigmaNoteBox.putAt(index, updateObject);
  }

}