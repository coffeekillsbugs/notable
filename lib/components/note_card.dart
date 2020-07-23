import 'package:flutter/material.dart';
import 'package:notes/Models/note.dart';
import 'package:notes/components/note_options.dart';
import 'package:notes/configs/colors.dart';

class NoteCard extends StatefulWidget {
  final int index;

  NoteCard(this.index);
  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  bool _isCollapsed = true;
  double _padding = 5.0;
  Duration _duration = Duration(milliseconds: 200);
  SimpleNote _simpleNote;

  @override
  Widget build(BuildContext context) {
    final Color _flavour = noteList[widget.index].color;
    _simpleNote = noteList[widget.index];
    //_width = MediaQuery.of(context).size.width - 40;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: AnimatedContainer(
        duration: _duration,
        curve: Curves.easeInOut,
        height: _isCollapsed ? 120.0 : 250,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: _flavour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: Offset(0.0, 3.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            // Note Options >>>--------------------->#
            NoteOptions(noteList[widget.index].position),
            // Note Card elements >>>----------------->#
            AnimatedPadding(
              duration: _duration,
              curve: Curves.easeInOut,
              padding: EdgeInsets.only(
                right: _isCollapsed ? _padding : 0.0,
                bottom: _isCollapsed ? 0.0 : 5.0,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_padding > 5.0) _padding = 5.0;
                    // else
                    _isCollapsed = !_isCollapsed;
                  });
                },
                onHorizontalDragEnd: _end,
                onHorizontalDragUpdate: _update,
                child: AnimatedContainer(
                  duration: _duration,
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(10.0),
                  height: _isCollapsed ? 120.0 : 250,
                  decoration: ShapeDecoration(
                    color: AppColor.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(0.0, 3.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            noteList[widget.index].title,
                            style: TextStyle(
                              color: _flavour,
                              fontSize: 20.0,
                              fontFamily: 'Merriweather',
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          AnimatedContainer(
                            duration: _duration,
                            curve: Curves.easeInOut,
                            height: _isCollapsed ? 54.0 : 184.0,
                            width: double.infinity,
                            child: SingleChildScrollView(
                              child: Text(
                                _simpleNote.body,
                                overflow:
                                    _isCollapsed ? TextOverflow.ellipsis : null,
                                maxLines: _isCollapsed ? 3 : null,
                                style: TextStyle(
                                  color: AppColor.isabelline,
                                  fontSize: 16.0,
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '12th April, 2019',
                        style: TextStyle(
                          color: _flavour.withAlpha(150),
                          fontSize: 14.0,
                          fontFamily: 'Merriweather',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _update(DragUpdateDetails details) {
    if (_padding >= 5.0 && _padding <= 40.0) {
      setState(() {
        if (details.primaryDelta.isNegative) {
          // print('primaryDelta[floor] : ${details.primaryDelta.floorToDouble()}');
          _padding = _padding - details.primaryDelta.floorToDouble();
        } else {
          // print('primaryDelta[ceil] : ${details.primaryDelta.ceilToDouble()}');
          _padding = _padding - details.primaryDelta.ceilToDouble();
        }
        // print('_padding : $_padding');
      });
    }

    if (_padding > 40.0) {
      _padding = 40.0;
    }
    if (_padding < 5.0) {
      _padding = 5.0;
    }

    // _deltaPadding = _padding;

    // if(_deltaPadding > )
  }

  void _end(DragEndDetails details) {
    //print('DED : ${details.primaryVelocity.}');
    if (details.primaryVelocity >= 0.0) {
      setState(() {
        _padding = 5.0;
      });
    }

    if (details.primaryVelocity < 0.0) {
      setState(() {
        _padding = 40.0;
      });
    }
  }
}
