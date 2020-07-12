import 'package:flutter/material.dart';
import 'package:notes/components/note_options.dart';
import 'package:notes/constants/colors.dart';

class NoteCard extends StatefulWidget {
  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  bool _isCollapsed = true;
  double _padding = 5.0;
  Duration _duration = Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    //_width = MediaQuery.of(context).size.width - 40;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: AnimatedContainer(
        duration: _duration,
        curve: Curves.easeInOut,
        height: _isCollapsed ? 120.0 : 250,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: AppColor.carribeanGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Stack(
          children: <Widget>[
            NoteOptions(),
            AnimatedPadding(
              duration: _duration,
              curve: Curves.easeInOut,
              padding: EdgeInsets.only(
                  right: _isCollapsed ? _padding : 0.0,
                  bottom: _isCollapsed ? 0.0 : 5.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_padding > 5.0)
                      _padding = 5.0;
                    else
                      _isCollapsed = !_isCollapsed;
                  });
                },
                onHorizontalDragUpdate: _update,
                child: AnimatedContainer(
                  duration: _duration,
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(10.0),
                  height: _isCollapsed ? 120.0 : 250,
                  decoration: ShapeDecoration(
                    color: AppColor.charlestonGreen,
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
                            'Heading',
                            style: TextStyle(
                              color: AppColor.carribeanGreen,
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
                            child: SingleChildScrollView(
                              child: Text(
                                'the quick fox jumps over the lazy dog. The uick fox jomoif ver the lazy dog. \nthe quick fox jumps over the sliaf dog. the uidkf lkj ulmpus over the lzy dog. The uick foroi jmps over the lazy dog',
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
                          color: AppColor.carribeanGreen.withAlpha(150),
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
    setState(() {
      // _padding = _padding + details.primaryDelta.abs();
      // if (_padding < 10.0)
      //   _padding = 5.0;
      // else
        _padding = 40.0;
      print('_padding : $_padding');
    });
  }
}
