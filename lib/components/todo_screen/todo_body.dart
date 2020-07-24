import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../configs/colors.dart';
import '../../providers/note_provider.dart';

class TodoBody extends StatelessWidget {
  final _index;

  TodoBody(this._index);
  @override
  Widget build(BuildContext context) {
    var _flavour = Provider.of<NoteProvider>(context).flavour;
    //var _height = MediaQuery.of(context).size.height - _padding;
    var _width = MediaQuery.of(context).size.width;
    var _itemList = Provider.of<NoteProvider>(context).itemList;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: _width - 140.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Text(
                _itemList[_index].text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.isabelline,
                  fontSize: 20.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('tapped checkbox');
              //TODO checkbox
            },
            child: Icon(
              MaterialIcons.check_box_outline_blank,
              color: _flavour,
              size: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController _itemController = TextEditingController();

  @override
  void dispose() {
    _itemController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _flavour = Provider.of<NoteProvider>(context).flavour;
    var _width = MediaQuery.of(context).size.width;
    var _addItem = Provider.of<NoteProvider>(context, listen: false);
    return Container(
      color: Colors.transparent,
      height: 52.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Add Item textfield >>>-------------------->#
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            width: _width - 112.0,
            height: 52.0,
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: Offset(0.0, 3.0),
                  blurRadius: 4.0,
                )
              ],
            ),
            child: TextField(
              scrollPhysics: BouncingScrollPhysics(),
              // onSubmitted: (String value) {
              //   FocusScope.of(context)
              //       .requestFocus(_bodyFocusNode);
              // },
              // focusNode: _addTaskFocusNode,
              controller: _itemController,
              keyboardType: TextInputType.text,
              cursorColor: AppColor.isabelline,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Task to perform...',
                hintStyle: TextStyle(
                  color: Colors.white.withAlpha(150),
                  fontSize: 20.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          // Add Item button >>>---------------------->#
          GestureDetector(
            onTap: () {
              if (_itemController.text.isNotEmpty)
                _addItem.addItem(_itemController.text);
            },
            child: Container(
              alignment: Alignment.center,
              width: 64.0,
              height: 52.0,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0.0, 3.0),
                    blurRadius: 4.0,
                  )
                ],
              ),
              child: Text(
                'ADD',
                style: TextStyle(
                  color: _flavour,
                  fontSize: 16.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
