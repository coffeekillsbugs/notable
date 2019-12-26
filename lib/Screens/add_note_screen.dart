import 'package:flutter/material.dart';
import 'package:notes/Constants/colors.dart';
import 'package:notes/Models/note.dart';

class NewNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                                  cursorColor: carribeanGreen,
                                  style: TextStyle(
                                    color: carribeanGreen,
                                    fontSize: 20.0,
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusColor: carribeanGreen,
                                    hintText: 'Title',
                                    hintStyle: TextStyle(
                                        color: carribeanGreen.withOpacity(0.5),
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
                            child: Container(
                              decoration: BoxDecoration(
                                  color: carribeanGreen,
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          )
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
                          cursorColor: carribeanGreen,
                          style: TextStyle(
                            color: carribeanGreen,
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusColor: carribeanGreen,
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
                                    color: carribeanGreen,
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
                                    color: carribeanGreen,
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
