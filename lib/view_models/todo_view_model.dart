import 'package:sigma/repository/hive_provider.dart';
import 'package:sigma/models/sigma_note.dart';

class TodoViewModel {

  String? title;
  DateTime? dateCreated;
  NoteType? noteType;
  List<TodoItemModel>? todoItems;

  TodoViewModel({this.title, this.dateCreated, this.noteType, this.todoItems});

  SigmaNote? getFromHiveProvider(int index) {
    HiveProvider getObject = HiveProvider();
    SigmaNote? readObject;

    readObject = getObject.readFromHive(index);

    return readObject;
  }

  void writeToHiveProvider(SigmaNote writeObject) {
    HiveProvider putObject = HiveProvider();

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

  void changeItemState(SigmaNote changeObject, int index) {
    HiveProvider modifyObject = HiveProvider();

    modifyObject.changeTodoItemState(changeObject, index);
  }
}