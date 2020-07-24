import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/note_provider.dart';

class NoteBody extends StatefulWidget {
  final padding;

  NoteBody(this.padding);
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
  Widget build(BuildContext context) {
    var _kheight = MediaQuery.of(context).size.height - widget.padding;
    var _width = MediaQuery.of(context).size.width;
    var _flavour = Provider.of<NoteProvider>(context).flavour;
    var _noteProvider = Provider.of<NoteProvider>(context);

    if (_noteProvider.isEditMode) {
      _bodyController.text = _noteProvider.noteBody().body;
      _titleController.text = _noteProvider.noteBody().title;
    }
    return SafeArea(
      child: Container(
        height: _kheight - 172,
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
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
                    color: _flavour,
                    fontSize: 30.0,
                    fontFamily: 'Merriweather'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: _flavour.withAlpha(150),
                    fontSize: 32.0,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            //SizedBox(height: 16.0),
            // Note Body >>>----------------------->#
            Container(
              height: _kheight - 298.0,
              child: TextField(
                focusNode: _bodyFocusNode,
                scrollPhysics: BouncingScrollPhysics(),
                controller: _bodyController,
                keyboardType: TextInputType.multiline,
                cursorColor: Colors.white,
                maxLines: null,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' Whats on your mind?',
                  hintStyle: TextStyle(
                    color: Colors.white.withAlpha(150),
                    fontSize: 20.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
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
