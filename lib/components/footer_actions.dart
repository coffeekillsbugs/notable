import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../configs/colors.dart';
import '../configs/constants.dart';
import '../providers/note_provider.dart';

class FooterActions extends StatefulWidget {
  @override
  _FooterActionsState createState() => _FooterActionsState();
}

class _FooterActionsState extends State<FooterActions> {
  
  @override
  Widget build(BuildContext context) {
    var _flavour = Provider.of<NoteProvider>(context).flavour;
    return Container(
      child: Row(
        children: <Widget>[
          //Back Button >>>--------------------------------->#
          GestureDetector(
            onTap: () {
              Provider.of<NoteProvider>(context, listen: false).updateMode(false);
              Navigator.pop(context);
            },
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColor.charlestonGreen,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0,
                  )
                ],
              ),
              child: Icon(
                Feather.chevron_left,
                color: _flavour,
                size: 30.0,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          // Save Button >>>-------------------------->#
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  //TODO save the note
                },
                borderRadius: BorderRadius.circular(10.0),
                splashColor: _flavour,
                child: Container(
                  height: 60.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColor.charlestonGreen,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.3),
                    //     offset: Offset(0.0, 3.0),
                    //     blurRadius: 5.0,
                    //   )
                    // ],
                  ),
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: _flavour,
                      fontSize: 25.0,
                      fontFamily: 'Righteous',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          // Color Selector >>>------------------------>#
          GestureDetector(
            onTap: modalSheet,
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _flavour,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void modalSheet() {
    setState(() {
      showModalBottomSheet(
        backgroundColor: AppColor.gunMetal,
        context: context,
        builder: (BuildContext builder) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: colorsChoice.length,
            itemBuilder: (BuildContext gridContext, index) {
              return Padding(
                padding: index == 0
                    ? EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 30.0, bottom: 10.0)
                    : EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                child: InkWell(
                  onTap: () {
                    setState(
                      () {
                        Provider.of<NoteProvider>(context, listen: false)
                            .changeColor(colorsChoice[index].color);
                        Navigator.pop(gridContext);
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: colorsChoice[index].color,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        colorNames[index].colorName,
                        style: TextStyle(
                          color: colorNames[index].textColor,
                          fontSize: 25.0,
                          fontFamily: 'Righteous',
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
    });
  }
}
