import 'package:hive/hive.dart';

part 'sigma_note.g.dart';

@HiveType(typeId: 1)
class SigmaNote {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime dateCreated;

  @HiveField(2)
  NoteType noteType;

  @HiveField(3)
  String noteBody;

  @HiveField(4)
  List<TodoItemModel> todoItems;

  SigmaNote(
      {this.title,
      this.dateCreated,
      this.noteType,
      this.noteBody,
      this.todoItems});
}

@HiveType(typeId: 2)
class TodoItemModel {
  @HiveField(0)
  String todoItem;

  @HiveField(1)
  bool isDone;

  TodoItemModel({this.todoItem, this.isDone});
}

@HiveType(typeId: 3)
enum NoteType {
  @HiveField(0)
  note,

  @HiveField(1)
  todo,
}
