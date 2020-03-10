import 'package:flutter/material.dart';
import 'package:notes/theme/colors.dart';
import 'package:notes/models/lists.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: gunMetal,
      body: ChangeNotifierProvider<UserColor>(
        create: (context) => UserColor(),
        child: Consumer<UserColor>(
          builder: (context, provider, child) => Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  8.0, MediaQuery.of(context).viewPadding.top, 8.0, 8.0),
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
                            // TODO : Splash color is not circular, spills
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(noteContext);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: charlestonGreen,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Colors.black.withOpacity(0.7),
                                      offset: Offset(1.0, 2.0),
                                      spreadRadius: 0.1,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: Provider.of<UserColor>(context)
                                        .userColor,
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
                            // TODO : Splash color is not circular, spills
                            child: InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    showModalBottomSheet(
                                      backgroundColor: gunMetal,
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return ListView.builder(
                                          itemCount: colorsChoice.length,
                                          itemBuilder:
                                              (BuildContext gridContext,
                                                  index) {
                                            return Padding(
                                              padding: index == 0 ? EdgeInsets.only(left: 15.0, right:15.0, top: 30.0, bottom: 10.0) : EdgeInsets.only(left: 15.0, right:15.0, top: 10.0, bottom: 10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(
                                                    () {
                                                      Provider.of<UserColor>(
                                                              context,
                                                              listen: false)
                                                          .changeColor(
                                                              colorsChoice[
                                                                      index]
                                                                  .color);
                                                      Navigator.pop(
                                                          gridContext);
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: colorsChoice[index]
                                                        .color,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 8.0,
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                        spreadRadius: 0.1,
                                                      )
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      colorNames[index]
                                                          .colorName,
                                                      style: TextStyle(
                                                        color:
                                                            colorNames[index]
                                                                .textColor,
                                                        fontSize: 25.0,
                                                        fontFamily:
                                                            'Righteous',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
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
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      Provider.of<UserColor>(context).userColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Colors.black.withOpacity(0.7),
                                      offset: Offset(1.0, 2.0),
                                      spreadRadius: 0.1,
                                    )
                                  ],
                                ),
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
                          color: charlestonGreen,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Colors.black.withOpacity(0.7),
                              offset: Offset(1.0, 2.0),
                              spreadRadius: 0.1,
                            )
                          ],
                        ),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          cursorColor:
                              Provider.of<UserColor>(context).userColor,
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
                              focusColor:
                                  Provider.of<UserColor>(context).userColor,
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
                                  color: charlestonGreen,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Colors.black.withOpacity(0.7),
                                      offset: Offset(1.0, 2.0),
                                      spreadRadius: 0.1,
                                    )
                                  ],
                                ),
                                child: Text(
                                  'SAVE',
                                  style: TextStyle(
                                    color: Provider.of<UserColor>(context)
                                        .userColor,
                                    fontSize: 22.0,
                                    fontFamily: 'Righteous',
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

class UserColor extends ChangeNotifier {
  Color userColor = carribeanGreen;

  void changeColor(Color changeColor) {
    userColor = changeColor;
    notifyListeners();
  }
}
