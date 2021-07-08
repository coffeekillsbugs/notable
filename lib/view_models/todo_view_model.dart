import 'package:sigma/repository/hive_provider.dart';
import 'package:sigma/models/sigma_note.dart';

class TodoViewModel {
  late String _title;
  late DateTime _dateCreated;
  late NoteType _noteType;
  List<TodoItemModel>? _todoItemList;

  String get title => _title;
  DateTime get dateCreated => _dateCreated;
  NoteType get noteType => _noteType;
  List<TodoItemModel>? get todoItemList => _todoItemList;

  TodoViewModel() {
    this._title = '';
    this._dateCreated = DateTime.now();
    this._noteType = NoteType.todo;
    this._todoItemList = [];
  }

  TodoViewModel.getFromHive(int index) {
    SigmaNote readObject = HiveProvider().readFromHive(index);

    this._title = readObject.title;
    this._dateCreated = readObject.dateCreated;
    this._noteType = readObject.noteType;
    this._todoItemList = readObject.todoItems;
  }

  void writeToHive(String title, DateTime dateCreated, NoteType noteType, List<TodoItemModel>? todoItemList) {
    HiveProvider().writeToHive(SigmaNote(
      title: title,
      dateCreated: dateCreated,
      noteType: noteType,
      todoItems: todoItemList,
    ));
  }

  void updateToHive(int index, String title, DateTime dateCreated, NoteType noteType, List<TodoItemModel>? todoItemList) {
    HiveProvider().updateInHive(
      index,
      SigmaNote(
        title: title,
        dateCreated: dateCreated,
        noteType: noteType,
        todoItems: todoItemList,
      ),
    );
  }

  void deleteInHive(int index) {
    HiveProvider().deleteInHive(index);
  }

  // SigmaNote getFromHiveProvider(int index) {
  //   HiveProvider getObject = HiveProvider();
  //   SigmaNote readObject;
  //
  //   readObject = getObject.readFromHive(index);
  //
  //   return readObject;
  // }

  // void writeToHiveProvider(SigmaNote writeObject) {
  //   HiveProvider putObject = HiveProvider();
  //
  //   putObject.writeToHive(writeObject);
  // }

  // void updateToHiveProvider(int index, SigmaNote updateObject) {
  //   HiveProvider putObject = HiveProvider();
  //
  //   putObject.updateInHive(index, updateObject);
  // }

  // void deleteFromHiveProvider(int index) {
  //   HiveProvider deleteObject = HiveProvider();
  //
  //   deleteObject.deleteInHive(index);
  // }

  // void changeItemState(SigmaNote changeObject, int index) {
  //   HiveProvider modifyObject = HiveProvider();
  //
  //   modifyObject.changeTodoItemState(changeObject, index);
  // }

  void changeTodoItemState(DateTime dateCreated, int todoItemIndex) {
    HiveProvider().changeTodoItemState(dateCreated, todoItemIndex);
  }
}
