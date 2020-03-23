import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:notes/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String tableName = 'Notes';
  String colId = 'id';
  String colBody = 'body';
  String colColor = 'color';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    
    if(_database == null){
      _database = await initializeDB();
    }
    return _database;
  }

  Future<Database> initializeDB() async{
    Directory databaseDirectory = await getApplicationDocumentsDirectory();
    String path = join(databaseDirectory.path, 'notes.db');

    var notesDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return notesDB;
  }

  void _onCreate(Database db, int ver) async {
    await db.execute('CREATE TABLE $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colBody TEXT, $colColor BLOB)');
  }


  //* CRUD Operations

  //* Read operation
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

    var result = await db.rawQuery('SELECT * FROM $tableName ORDER BY $colId ASC');
    return result;
  }

  //* Insert operation
  Future<int> insertNote(Note note) async {
    Database db = await this.database;

    var result = await db.insert(tableName, note.toMap());
    return result;
  }

  //* Update operation
  Future<int> updateNote(Note note) async {
    Database db = await this.database;

    var result = await db.update(tableName, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  //* Delete operation
  Future<int> deleteNote(int id) async {
    Database db = await this.database;

    var result = await db.rawDelete('DELETE FROM $tableName WHERE $colId = $id');
    return result;
  }

  //* Get count
  Future<int> getCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $tableName');
    int result = Sqflite.firstIntValue(x);

    return result;
  }

  //* Get Map List from database, convert into Note List
  Future<List<Note>> toNoteList() async {
    
    var noteMapList = await getNoteMapList();
    int count = noteMapList.length;

    List<Note> noteList = List<Note>();

    for(int i = 0 ; i < count ; i++) {
      noteList.add(Note.fromMap(noteMapList[i]));
    }
    return noteList;
  }
}


