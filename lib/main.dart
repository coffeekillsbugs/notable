import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(Notable());

class Notable extends StatefulWidget {
  @override
  _NotableState createState() => _NotableState();
}

class _NotableState extends State<Notable> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF202223),
          /*App Bar*/
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            leading: Icon(
              Icons.sort,
              color: Color(0xFF00994C),
            ),
            title: Text(
              'NOTABLE',
              style: TextStyle(
                color: Color(0xFF00994C),
                fontFamily: 'Righteous',
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          /*Note Elements and Add Button*/
          body: Stack(
            children: <Widget>[
              /*Notes List*/
              ListView(),
              /*Add Button*/
              Container(
                margin: EdgeInsets.only(bottom: 0.0),
                alignment: Alignment(0.0, 1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  child: FlatButton(
                    onPressed: () {
                      //TODO: Add note
                    },
                    child: Icon(Icons.add, color: Colors.white),
                    color: Color(0xFF00994C),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*################### Obsolete Code ####################*/
// class Notes extends StatefulWidget {
//   @override
//   _NotesState createState() => _NotesState();
// }

// class _NotesState extends State<Notes> {

//   List<Card> notes = List();

//   String title1 = 'Studying';
//   String subtitle1 = 'I have to study Economincs tonight. I have to study Economincs tonight. I have to study togiignfidf sdf sdf .';

//   Card noteList ({Color color, String mainTitle, String mainSubtitle}) {
//     return Card(
//                     color: color,
//                     child: Column(
//                       children: <Widget>[
//                         ListTile(
//                           contentPadding: EdgeInsets.fromLTRB(
//                             20.0, 20.0, 20.0, 0.0
//                           ),
//                           title: Text(
//                             mainTitle,
//                             style: TextStyle(
//                               fontSize: 40.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                           subtitle: Text(
//                             mainSubtitle,
//                             style: TextStyle(
//                               fontSize: 15.0,
//                               color: Colors.white,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         ButtonBar(
//                           alignment: MainAxisAlignment.end,
//                           children: <Widget>[
//                             IconButton(
//                               onPressed: () {
//                               //TODO edit function
//                               },
//                               icon: Icon(
//                                 Icons.mode_edit,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                               //TODO delete function
//                               },
//                               icon: Icon(
//                                 Icons.delete,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           floatingActionButton: FloatingActionButton(
//               backgroundColor: Colors.orange,
//               onPressed: () {
//                 //TODO add new note
//               },
//               child: Icon(
//                 Icons.add,
//                 color: Colors.white,
//               ),
//             ),
//           backgroundColor: Colors.white,
//           body: ListView(
//             children: <Widget>[

//                   Column(

//                     children: <Widget>[
//                       noteList(
//                         color: Colors.amber,
//                         mainTitle: title1,
//                         mainSubtitle : subtitle1),
//                       noteList(
//                         color: Colors.pink,
//                         mainTitle: title1,
//                         mainSubtitle : subtitle1),
//                       noteList(
//                         color: Colors.green,
//                         mainTitle: title1,
//                         mainSubtitle : subtitle1),
//                       noteList(
//                         color: Colors.teal,
//                         mainTitle: title1,
//                         mainSubtitle : subtitle1),
//                     ],
//                   ),

//             ],
//           )
//         ),
//       )
//     );
//   }
// }

// class NoteList {

//   final String title;
//   final String des;

//   NoteList({this.title, this.des});
// }

// void databaseConnect () async{

//   final Future<Database> noteDatabase = openDatabase(
//     join(await getDatabasesPath(), 'note_database.db')
//   );

// }

/*`############################### Temp Code ######################*/
// appBar: PreferredSize(
//             child: Container(
//               decoration: BoxDecoration(boxShadow: [
//                 BoxShadow(
//                   color: Colors.greenAccent[700],
//                   offset: Offset(0, 0.5),
//                   blurRadius: 4.0,
//                 )
//               ]),
//               child: AppBar(
//                 elevation: 0.0,
//                 title: Text("Notes"),
//                 leading: Icon(
//                   Icons.menu,
//                   color: Colors.greenAccent[700],
//                 ),
//                 backgroundColor: Colors.black,
//               ),
//             ),
//             preferredSize: Size.fromHeight(kToolbarHeight),
//           ),
//           body: Container(),
