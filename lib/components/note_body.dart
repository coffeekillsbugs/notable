import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/colors.dart';
import '../providers/note_provider.dart';

class NoteBody extends StatefulWidget {
  // final padding;

  // NoteBody(this.padding);
  @override
  _NoteBodyState createState() => _NoteBodyState();
}

class _NoteBodyState extends State<NoteBody> {
  FocusNode _bodyFocusNode, _titleFocusNode;
  TextEditingController _bodyController, _titleController;

  @override
  void initState() {
    super.initState();

    _bodyController = TextEditingController();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _bodyController.dispose();
    _titleController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext ctx) {
    var _kheight = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    var _flavour = Provider.of<NoteProvider>(context).flavour;
    var _noteProvider = Provider.of<NoteProvider>(context);

    if (_noteProvider.isEditMode) {
      _bodyController.text = _noteProvider.noteBody().body;
      _titleController.text = _noteProvider.noteBody().title;
    }
    return SafeArea(
          child: Container(
        height: _kheight - 196,
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
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
        child: Column(
          children: <Widget>[
            // Note Title >>>---------------------->#
            Container(
              height: 60.0,
              width: _width - 40.0,
              child: TextField(
                scrollPhysics: BouncingScrollPhysics(),
                onSubmitted: (String value) {
                  FocusScope.of(context).requestFocus(_bodyFocusNode);
                },
                focusNode: _titleFocusNode,
                controller: _titleController,
                keyboardType: TextInputType.text,
                cursorColor: _flavour,
                maxLines: 1,
                style: TextStyle(
                    color: _flavour, fontSize: 30.0, fontFamily: 'Merriweather'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: _flavour.withAlpha(100),
                    fontSize: 30.0,
                    fontFamily: 'Merriweather',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Note Body >>>----------------------->#
            Container(
              height: _kheight - 286.0,
              child: TextField(
                focusNode: _bodyFocusNode,
                scrollPhysics: BouncingScrollPhysics(),
                controller: _bodyController,
                keyboardType: TextInputType.multiline,
                cursorColor: AppColor.isabelline,
                maxLines: null,
                style: TextStyle(
                    color: AppColor.isabelline,
                    fontSize: 22.0,
                    fontFamily: 'SourceSansPro'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Dump your short term memory here...',
                  hintStyle: TextStyle(
                    color: AppColor.isabelline.withAlpha(100),
                    fontSize: 22.0,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
