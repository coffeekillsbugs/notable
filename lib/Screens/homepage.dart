import 'package:flutter/material.dart';
import 'package:notes/Models/note.dart';
import 'package:notes/components/note_layout.dart';
import 'package:notes/database/database.dart';
import 'package:notes/theme/colors.dart';
import 'package:notes/models/lists.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> listNote;
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (listNote == null) {
      listNote = List<Note>();
      updateListNote();
    }

    return Provider(
      create: (context) => screenSize,
      child: Stack(
        children: <Widget>[
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: gunMetal,
            // *--- Body ---* //
            body: (count == 0) ? EmptyContainer() : GridViewNotes(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppBarDrop(),
              AddNote(),
            ],
          ),
        ],
      ),
    );
  }

  void updateListNote() {

    final Future<Database> dbFuture = databaseHelper.initializeDB();

    dbFuture.then( (database) {
      Future<List<Note>> listNoteFuture = databaseHelper.toNoteList();
      listNoteFuture.then((listNote) {
        setState(() {
          this.listNote = listNote;
          this.count = listNote.length;
        });
      });
    });
  }
}

class AppBarDrop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.125,
      decoration: BoxDecoration(
        color: charlestonGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black.withOpacity(0.7),
            offset: Offset(2.0, 3.0),
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top, right: 10.0),
          child: Material(
            color: Colors.transparent,
            child: Text(
              'NOTABLE',
              style: TextStyle(
                color: carribeanGreen,
                fontFamily: 'Righteous',
                fontSize: 26.0,
                //fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Such Empty! Click on "Add" button to add notes.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: carribeanGreen,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}

class GridViewNotes extends StatefulWidget {
  @override
  _GridViewNotesState createState() => _GridViewNotesState();
}

class _GridViewNotesState extends State<GridViewNotes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.125 -
              MediaQuery.of(context).viewPadding.top +
              5.0),
      child: Container(
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
          ),
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return NoteLayout(
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class AddNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 120.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'addNote');
          },
          child: Container(
            height: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: carribeanGreen,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Colors.black,
                  offset: Offset(2.0, 3.0),
                  spreadRadius: 0.3,
                )
              ],
            ),
            child: Icon(
              Icons.add,
              color: charlestonGreen,
              size: 35.0,
            ),
          ),
        ),
      ),
    );
  }
}

