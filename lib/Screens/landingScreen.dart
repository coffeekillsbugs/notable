import 'package:flutter/material.dart';
import 'package:notes/Constants/Colors.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*----AppBar---*/
      appBar: AppBar(
        /*---Icon Button---*/
        leading: IconButton(
              onPressed:() {
                
              },
              icon: Icon(Icons.sort, color: carribeanGreen),
            ),
        /*---Notable---*/
        title: Text(
              'NOTABLE',
              style: TextStyle(
                color: carribeanGreen,
                fontFamily: 'Righteous',
                fontSize: 25.0,
                //fontWeight: FontWeight.w600,
              ),
            ),
          centerTitle: true,
      ),
      /*---Body---*/
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: NoteCard(),
                ),
                Expanded(
                  flex: 1,
                  child: NoteCard(),
                ),
                Expanded(
                  flex: 1,
                  child: NoteCard(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: NoteCard(),
                ),
                Expanded(
                  flex: 1,
                  child: NoteCard(),
                ),
                Expanded(
                  flex: 1,
                  child: NoteCard(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: NoteCard(),
                ),
                Expanded(
                  flex: 1,
                  child: NoteCard(),
                ),
                Expanded(
                  flex: 1,
                  child: NoteCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
      ),
          child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: outerSpace,
          border: Border(
            bottom: BorderSide(
              width: 3.0,
              //style: BorderStyle.solid,
              color: carribeanGreen,
            ),
          ),
        ),
      ),
    );
  }
}