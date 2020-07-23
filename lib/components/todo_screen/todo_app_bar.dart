import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notes/configs/colors.dart';
import 'package:notes/providers/note_provider.dart';

class TodoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _flavour = Provider.of<NoteProvider>(context).flavour;
    return Container(
      height: 60.0,
      color: AppColor.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
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
            color: _flavour, fontSize: 30.0, fontFamily: 'Merriweather'),
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
    );
  }
}


class TodoHeader extends SliverPersistentHeaderDelegate {
  TodoHeader({this.maxHeight, this.minHeight});

  final double minHeight;
  final double maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return TodoAppBar();
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
