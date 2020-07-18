import 'package:flutter/material.dart';
import 'package:notes/Models/todo_item_model.dart';
import 'package:notes/configs/colors.dart';

class Note {
  String _title;
  Color _color;
  DateTime _dateTime;
  NoteType _noteType;

  Note(this._title, this._color, this._dateTime, this._noteType);

  NoteType get noteType => _noteType;
  Color get color => _color;
  String get title => _title;
  DateTime get dateTime => _dateTime;
}

enum NoteType {
  SimpleNote,
  TodoNote,
}

class SimpleNote extends Note {
  String _title;
  String _body;
  Color _color;
  DateTime _dateTime;

  SimpleNote(this._title, this._body, this._color, this._dateTime)
      : super(_title, _color, _dateTime, NoteType.SimpleNote);

  String get body => _body;
}

class TodoNote extends Note {
  String _title;
  List<TodoItemModel> _todoList;
  Color _color;
  DateTime _dateTime;

  TodoNote(this._title, this._todoList, this._color, this._dateTime)
      : super(_title, _color, _dateTime, NoteType.TodoNote);

  List<TodoItemModel> get todoList => _todoList;
}

List<Note> noteList = [
  SimpleNote(
    'Chemistry',
    'These are the notes of today\' lecture',
    AppColor.lemonYellow,
    DateTime.now(),
  ),
  TodoNote(
    'Shopping',
    todoItem,
    AppColor.mintGreen,
    DateTime.now(),
  ),
  TodoNote(
    'Shopping',
    todoItem,
    AppColor.amazonite,
    DateTime.now(),
  ),
  SimpleNote(
    'Physics',
    'These are the notes of today\' lecture',
    AppColor.sunsetOrange,
    DateTime.now(),
  ),
  SimpleNote(
    'Biology',
    'These are the notes of today\' lecture',
    AppColor.redCrayola,
    DateTime.now(),
  ),
];
