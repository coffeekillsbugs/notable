import '../repository/hive_provider.dart';
import '../models/sigma_note.dart';

class NoteViewModel {

  String? title;
  DateTime? dateCreated;
  NoteType? noteType;
  String? noteBody;

  NoteViewModel({this.title, this.dateCreated, this.noteType, this.noteBody});

  SigmaNote? getFromHiveProvider(int index) {
    HiveProvider getObject = HiveProvider();
    SigmaNote? readObject;

    readObject = getObject.readFromHive(index);
    // CHECK : What if the object is not found?

    return readObject;
  }

  void writeToHiveProvider(SigmaNote writeObject) {
    HiveProvider putObject = HiveProvider();

    print('here: $writeObject');
    putObject.writeToHive(writeObject);
  }

  void updateToHiveProvider(int index, SigmaNote updateObject) {
    HiveProvider putObject = HiveProvider();

    putObject.updateInHive(index, updateObject);
  }

  void deleteFromHiveProvider(int index) {
    HiveProvider deleteObject = HiveProvider();

    deleteObject.deleteInHive(index);
  }
}