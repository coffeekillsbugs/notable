import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notes/configs/colors.dart';
import 'package:notes/providers/flag_provider.dart';

class TodoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _flavour = Provider.of<FlagProvider>(context).flavour;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: AppColor.charlestonGreen,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            scrollPhysics: BouncingScrollPhysics(),
            // onSubmitted: (String value) {
            //   FocusScope.of(context)
            //       .requestFocus(_addTaskFocusNode);
            // },
            // focusNode: _titleFocusNode,
            //controller: _searchController,
            keyboardType: TextInputType.text,
            cursorColor: _flavour,
            maxLines: 1,
            style: TextStyle(
              color: _flavour,
              fontSize: 30.0,
              fontFamily: 'Merriweather',
            ),
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
      ),
    );
  }
}