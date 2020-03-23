import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:notes/Models/note.dart';

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

// class DBHelper {

//   static Database _db;

//   Future<Database> get db async{
//     if(_db !=null)
//       return _db;
//     _db = await initDb();
//       return _db;
//   }

//   //Creating a database with name notes.db
//   initDb() async {
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, "notes.db");
//     var theDB = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return theDB;
//   }

//   // Creating a table name notes
//   void _onCreate(Database db, int version) async {
//     // when creating the db, create the table
//     await db.execute(
//       "CREATE TABLE Notes(id INTEGER PRIMARY KEY, body TEXT, color TEXT)"
//     );
//     print('Created tables.');
//   }

//   //* Retreving notes from notes table *//
//   Future<List<Note>> getNotes() async {
//     var dbClient = await db;
//     List<Map> list = await dbClient.rawQuery('Select * from Notes');
//     List<Note> savedNotes = new List();
//     for (int i = 0; i < list.length; i++) {
//       savedNotes.add(Note(list[i]["id"], list[i]["body"], list[i]["color"]));
//     }
//     print(savedNotes.length);
//     return savedNotes;
//   }

//   void saveNotes(Note newNote) async {
//     var dbClient = await db;
//     await dbClient.transaction((txn) async {
//       return await txn.rawInsert('INSERT INTO Notes(id, body, color) VALUES(' +
//       '\'' +
//       newNote.id +
//       '\'' + )
//     })
//   }
// }
