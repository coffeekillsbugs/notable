import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:notes/constants/colors.dart';

class BottomFloater extends StatefulWidget {
  @override
  _BottomFloaterState createState() => _BottomFloaterState();
}

class _BottomFloaterState extends State<BottomFloater> {
  TextEditingController _searchController;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            height: 60.0,
            width: MediaQuery.of(context).size.width - 90,
            decoration: BoxDecoration(
              color: AppColor.charlestonGreen,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: Offset(0.0, 3.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      controller: _searchController,
                      cursorColor: AppColor.carribeanGreen,
                      style: TextStyle(
                          color: AppColor.carribeanGreen,
                          fontSize: 18.0,
                          fontFamily: 'Merriweather'),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: AppColor.carribeanGreen.withAlpha(150),
                          fontSize: 18.0,
                          fontFamily: 'Merriweather',
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            _hasText = true;
                          } else
                            _hasText = false;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                _hasText
                    ? GestureDetector(
                        child: Container(
                          child: Icon(
                            AntDesign.close,
                            color: AppColor.carribeanGreen,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _searchController.text = '';
                            _hasText = false;
                          });
                        },)
                    : Container(),
              ],
            ),
          ),
          GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  color: AppColor.carribeanGreen,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Icon(
                  Feather.plus,
                  color: AppColor.charlestonGreen,
                  size: 30.0,
                ),
              ),
              onTap: () {
                //TODO ask new note type
              }),
        ],
      ),
    );
  }
}
