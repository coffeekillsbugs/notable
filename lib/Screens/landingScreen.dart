import 'package:flutter/material.dart';
import 'package:notes/Constants/Colors.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    print(screenSize.width);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Stack(
          children: <Widget>[
            Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: smokyBlack,
                leading: InkWell(
                  child: Icon(Icons.sort, color: carribeanGreen),
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
              backgroundColor: smokyBlack,
              /*---Body---*/
              body: GridView(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,),
                children: <Widget>[
                  NoteLayout(screenSize: screenSize),
                  NoteLayout(screenSize: screenSize),
                  NoteLayout(screenSize: screenSize),
                  NoteLayout(screenSize: screenSize),
                  NoteLayout(screenSize: screenSize),
                  NoteLayout(screenSize: screenSize),
                  NoteLayout(screenSize: screenSize),
                  NoteLayout(screenSize: screenSize),
                ],
              ),
              floatingActionButton: AddNote(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
            //CustomAppBar(screenSize: screenSize)
          ],
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
      child: Container(
        height: 50.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: carribeanGreen,
        ),
        child: InkWell(
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

class NoteLayout extends StatelessWidget {
  final screenSize, variableHeight;

  NoteLayout({this.screenSize, this.variableHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
      child: Container(
       // height: 200.0,
        //width: screenSize.width * 0.45,
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            color: outerSpace,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: carribeanGreen,
                offset: Offset(0, 3),
                blurRadius: 1.0,
              ),
            ],
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
