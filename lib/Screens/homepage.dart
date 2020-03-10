import 'package:flutter/material.dart';
import 'package:notes/components/note_layout.dart';
import 'package:notes/theme/colors.dart';
import 'package:notes/models/lists.dart';
import 'package:provider/provider.dart';
import 'package:notes/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Provider(
      create: (context) => screenSize,
      child: Stack(
        children: <Widget>[
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: gunMetal,
            // *--- Body ---* //
            body: (notes.length == 0) ? EmptyContainer() : GridViewNotes(),
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
}

class AppBarDrop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        color: charlestonGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.all(10.0),
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
          child: Text('Such Empty! Click on "Add" button to add notes.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: carribeanGreen,
                fontSize: 30.0,
              )),
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
      padding: EdgeInsets.only(top: 55.0),
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
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 130.0),
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
              borderRadius: BorderRadius.circular(10.0),
              color: carribeanGreen,
            ),
            child: Icon(
              Icons.add,
              color: smokyBlack,
              size: 35.0,
            ),
          ),
        ),
      ),
    );
  }
}
