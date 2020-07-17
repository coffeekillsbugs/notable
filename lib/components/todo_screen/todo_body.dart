import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../configs/colors.dart';
import '../../providers/flag_provider.dart';

class TodoBody extends StatelessWidget {
  final _padding;

  TodoBody(this._padding);
  @override
  Widget build(BuildContext context) {
    var _flavour = Provider.of<FlagProvider>(context).flavour;
    var _height = MediaQuery.of(context).size.height - _padding;
    var _width = MediaQuery.of(context).size.width;
    var _itemList = Provider.of<FlagProvider>(context).itemList;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        // Todo ListView Builder >>>----------------------->#
        Container(
          color: Colors.transparent,
          height: _height - 160.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            physics: BouncingScrollPhysics(),
            itemCount: _itemList.length,
            itemBuilder: (context, index) => _itemList.length == 0 ? Center(child: Text('Add Items'),) : Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                height: 50.0,
                decoration: BoxDecoration(
                  color: AppColor.gunMetal,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: _width - 80.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Text(
                          _itemList[index].text,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColor.isabelline,
                            fontSize: 22.0,
                            fontFamily: 'SourceSansPro',
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
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        // Todo Adder >>>------------------------>#
        AddItem(),
      ],
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
    var _flavour = Provider.of<FlagProvider>(context).flavour;
    var _width = MediaQuery.of(context).size.width;
    var _addItem = Provider.of<FlagProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      child: Container(
        color: Colors.transparent,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              width: _width - 110.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: AppColor.charlestonGreen,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0,
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
                  color: AppColor.isabelline,
                  fontSize: 25.0,
                  fontFamily: 'SourceSansPro',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Task to perform...',
                  hintStyle: TextStyle(
                    color: AppColor.isabelline.withAlpha(100),
                    fontSize: 25.0,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if(_itemController.text.isNotEmpty)
                _addItem.addItem(_itemController.text);
              },
              child: Container(
                alignment: Alignment.center,
                width: 80.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: AppColor.charlestonGreen,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Text(
                  'ADD',
                  style: TextStyle(
                    color: _flavour,
                    fontSize: 25.0,
                    fontFamily: 'Righteous',
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