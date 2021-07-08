import 'package:sigma/repository/hive_provider.dart';
import 'package:sigma/models/sigma_note.dart';

class HomePageViewModel {
  late NoteType _noteType;

  NoteType getNoteType(int index) {
    HiveProvider hiveProvider = HiveProvider();

    _noteType = hiveProvider.getNoteType(index);

    return _noteType;
  }
}