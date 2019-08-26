import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(Notes());

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  List<Card> notes = List();

  String title1 = 'Studying';
  String subtitle1 = 'I have to study Economincs tonight. I have to study Economincs tonight. I have to study togiignfidf sdf sdf .';

  Card noteList ({Color color, String mainTitle, String mainSubtitle}) {
    return Card(
                    color: color,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(
                            20.0, 20.0, 20.0, 0.0
                          ),
                          title: Text(
                            mainTitle,
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            mainSubtitle,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                              //TODO edit function
                              },
                              icon: Icon(
                                Icons.mode_edit,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                              //TODO delete function
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                //TODO add new note
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              
                  Column(
                    
                    children: <Widget>[
                      noteList(
                        color: Colors.amber, 
                        mainTitle: title1, 
                        mainSubtitle : subtitle1),
                      noteList(
                        color: Colors.pink, 
                        mainTitle: title1, 
                        mainSubtitle : subtitle1),
                    ],
                  ),
              
            ],
          )
        ),
      )
    );
  }
}

class NoteList {
  
  final String title;
  final String des;

  NoteList({this.title, this.des});
}

void databaseConnect () async{
  
  final Future<Database> noteDatabase = openDatabase(
    join(await getDatabasesPath(), 'note_database.db')
  );

}

