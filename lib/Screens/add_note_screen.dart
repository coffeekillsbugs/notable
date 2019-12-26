import 'package:flutter/material.dart';
import 'package:notes/Constants/colors.dart';
import 'package:notes/Constants/lists.dart';
import 'package:notes/Models/note.dart';

class NewNote extends StatefulWidget {
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  @override
  Widget build(BuildContext context) {
    Color userColor = carribeanGreen;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: smokyBlack,
          body: Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: outerSpace,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  cursorColor: userColor,
                                  style: TextStyle(
                                    color: userColor,
                                    fontSize: 20.0,
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusColor: userColor,
                                    hintText: 'Title',
                                    hintStyle: TextStyle(
                                        color: userColor.withOpacity(0.5),
                                        fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  backgroundColor: gunMetal,
                                  context: context,
                                  builder: (BuildContext builder) {
                                    return Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: GridView.builder(
                                        itemCount: colorsChoice.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(
                                                    () {
                                                      userColor = colorsChoice[index].color;
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: colorsChoice[index]
                                                          .color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),),
                                                ),
                                              ),);
                                        },
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          //crossAxisSpacing: 3.0,
                                          childAspectRatio: 1.2,
                                        ),
                                      ),
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: userColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: gunMetal,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          cursorColor: userColor,
                          style: TextStyle(
                            color: userColor,
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusColor: userColor,
                              contentPadding: EdgeInsets.all(10.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              splashColor: gunMetal,
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: outerSpace,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: userColor,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 3,
                            child: InkWell(
                              splashColor: null,
                              onTap: () {
                                //TODO Save the note
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: userColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Text(
                                  'SAVE',
                                  style: TextStyle(
                                    color: gunMetal,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}