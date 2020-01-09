import 'package:flutter/material.dart';
import 'package:notes/Constants/colors.dart';
import 'package:notes/Constants/lists.dart';
import 'package:notes/Screens/add_note_screen.dart';
import 'package:notes/Widgets/new_note.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Provider(
      create: (context) => screenSize,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: smokyBlack,
          accentColor: carribeanGreen,
          scaffoldBackgroundColor: smokyBlack,
        ),
        home: SafeArea(
          child: Stack(
            children: <Widget>[
              Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  backgroundColor: charlestonGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    )
                  ),
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'NOTABLE',
                      style: TextStyle(
                        color: carribeanGreen,
                        fontFamily: 'Righteous',
                        fontSize: 25.0,
                        //fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                backgroundColor: gunMetal,
                // *--- Body ---* //
                body: (notes.length == 0) ? EmptyContainer() : GridViewNotes(),
                // *--- Add Button ---* //
                floatingActionButton: AddNote(),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
              ),
              //CustomAppBar(screenSize: screenSize)
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({
    Key key,
  }) : super(key: key);

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
            )
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
    return Container(
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
          return NoteLayout(index: index,);
        },
      ),
    );
  }
}

class AddNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 130.0),
      child: Container(
        height: 50.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: carribeanGreen,
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewNote()));
          },
          child: Icon(
            Icons.add,
            color: smokyBlack,
            size: 35.0,
          ),
        ),
      ),
    );
  }
}



/*
CustomAppBar(
            backgroundColor: smokyBlack,
            /*---Icon Button---*/
            leading: IconButton(
              onPressed: () {},
              icon: ,
            ),
            /*---Notable---*/
            title: 
            centerTitle: true,
          ),
  */
