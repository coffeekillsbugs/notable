import 'package:flutter/material.dart';
import 'package:notes/Constants/colors.dart';
import 'package:notes/Constants/lists.dart';
import 'package:provider/provider.dart';

class NewNote extends StatefulWidget {
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {

  FocusNode nextField;

  @override
  void initState() {
    super.initState();
    nextField = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    nextField.dispose();
  }

  //Color userColor = carribeanGreen;
  @override
  Widget build(BuildContext noteContext) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: smokyBlack,
          body: ChangeNotifierProvider<UserColor>(
            create: (context) => UserColor(),

                      child: Consumer<UserColor>(
                        builder: (context, provider, child) => Container(
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
                              // * Back Button * //
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  splashColor: gunMetal,
                                  onTap: () {
                                    Navigator.pop(noteContext);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: outerSpace,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.chevron_left,
                                        color: Provider.of<UserColor>(context).userColor,
                                        size: 40.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              // * Current Color Box * //
                              Expanded(
                                flex: 3,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showModalBottomSheet(
                                      backgroundColor: gunMetal,
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: GridView.builder(
                                            itemCount: colorsChoice.length,
                                            itemBuilder:
                                                (BuildContext gridContext, index) {
                                              return Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(
                                                        () {
                                                          Provider.of<UserColor>(context, listen: false).changeColor(colorsChoice[index].color);
                                                          Navigator.pop(gridContext);
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
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Provider.of<UserColor>(context).userColor,
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
                              cursorColor: Provider.of<UserColor>(context).userColor,
                              focusNode: nextField,
                              textInputAction: TextInputAction.newline,
                              style: TextStyle(
                                color: Provider.of<UserColor>(context).userColor,
                                fontSize: 20.0,
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusColor: Provider.of<UserColor>(context).userColor,
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
                                flex: 3,
                                child: InkWell(
                                  splashColor: null,
                                  onTap: () {
                                    //TODO Save the note
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Provider.of<UserColor>(context).userColor,
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
        ),
      ),
    );
  }
}

class UserColor extends ChangeNotifier{
  Color userColor = carribeanGreen;

  void changeColor(Color changeColor) {
    userColor = changeColor;
    notifyListeners();
  }
}

// Title text field
// Container(
//                                   decoration: BoxDecoration(
//                                       color: outerSpace,
//                                       borderRadius: BorderRadius.circular(10.0)),
//                                   child: Padding(
//                                     padding: EdgeInsets.all(10.0),
//                                     child: TextField(
//                                       keyboardType: TextInputType.text,
//                                       cursorColor: Provider.of<UserColor>(context).userColor,
//                                       textInputAction: TextInputAction.next,
//                                       onEditingComplete: () =>
//                                         FocusScope.of(context).requestFocus(nextField),
//                                       style: TextStyle(
//                                         color: Provider.of<UserColor>(context).userColor,
//                                         fontSize: 20.0,
//                                       ),
//                                       decoration: InputDecoration(
//                                         enabledBorder: UnderlineInputBorder(
//                                           borderSide: BorderSide.none,
//                                         ),
//                                         focusedBorder: UnderlineInputBorder(
//                                           borderSide: BorderSide.none,
//                                         ),
//                                         focusColor: Provider.of<UserColor>(context).userColor,
//                                         hintText: 'Title',
//                                         hintStyle: TextStyle(
//                                             color: Provider.of<UserColor>(context).userColor.withOpacity(0.5),
//                                             fontSize: 20.0),
//                                       ),
//                                     ),
//                                   ),
//                                 ),