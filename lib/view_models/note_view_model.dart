import 'package:sigma/repository/hive_provider.dart';
import 'package:sigma/models/sigma_note.dart';

class NoteViewModel {

  late String _title;
  late DateTime _dateCreated;
  late NoteType _noteType;
  String? _noteBody;

  String get title => _title;
  DateTime get dateCreated => _dateCreated;
  NoteType get noteType => _noteType;
  String? get noteBody => _noteBody;

  // NoteViewModel({this.title, this.dateCreated, this.noteType, this.noteBody});

  NoteViewModel() {
    this._title = '';
    this._dateCreated = DateTime.now();
    this._noteType = NoteType.note;
    this._noteBody = '';
  }

  NoteViewModel.getFromHive(int index) {
    SigmaNote readObject = HiveProvider().readFromHive(index);

    this._title = readObject.title;
    this._dateCreated = readObject.dateCreated;
    this._noteType = readObject.noteType;
    this._noteBody = readObject.noteBody;
  }

  // SigmaNote getFromHiveProvider(int index) {
  //   HiveProvider getObject = HiveProvider();
  //   SigmaNote readObject;
  //
  //   readObject = getObject.readFromHive(index);
  //   // CHECK : What if the object is not found?
  //
  //   return readObject;
  // }

  void writeToHive(String title, DateTime dateCreated, NoteType noteType, String? noteBody) {
    HiveProvider().writeToHive(SigmaNote(
      title: title,
      dateCreated: dateCreated,
      noteType: noteType,
      noteBody: noteBody,
    ));
  }

  // void writeToHiveProvider(SigmaNote writeObject) {
  //   HiveProvider putObject = HiveProvider();
  //
  //   print('here: $writeObject');
  //   putObject.writeToHive(writeObject);
  // }

  void updateToHive(int index, String title, DateTime dateCreated, NoteType noteType, String? noteBody) {
    HiveProvider().updateInHive(
      index,
      SigmaNote(
        title: title,
        dateCreated: dateCreated,
        noteType: noteType,
        noteBody: noteBody,
      ),
    );
  }

  // void updateToHiveProvider(int index, SigmaNote updateObject) {
  //   HiveProvider putObject = HiveProvider();
  //
  //   putObject.updateInHive(index, updateObject);
  // }

  void deleteInHive(int index) {
    HiveProvider().deleteInHive(index);
  }

  // void deleteFromHiveProvider(int index) {
  //   HiveProvider deleteObject = HiveProvider();
  //
  //   deleteObject.deleteInHive(index);
  // }
}