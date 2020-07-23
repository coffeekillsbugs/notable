import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../configs/colors.dart';
import '../providers/note_provider.dart';

class TodoButton extends StatefulWidget {
  final Function toggleVisibility;
  TodoButton({Key key, @required this.toggleVisibility}) : super(key: key);
  @override
  TodoButtonState createState() => TodoButtonState();
}

class TodoButtonState extends State<TodoButton>
    with SingleTickerProviderStateMixin {
  AnimationController todoController;
  Animation<double> todoAnimation;

  @override
  void initState() {
    super.initState();

    todoController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    todoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        curve: Curves.elasticInOut,
        parent: todoController,
        reverseCurve: Curves.elasticInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _change = Provider.of<NoteProvider>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(bottom: 10.0, left: _width - 92.0),
      child: AnimatedBuilder(
        animation: todoController,
        builder: (context, child) => Transform.scale(
          scale: todoAnimation.value,
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0.0, 3.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Icon(
                MaterialCommunityIcons.checkbox_marked_outline,
                color: AppColor.brandPink,
                size: 25.0,
              ),
            ),
            onTap: () {
              widget.toggleVisibility(_change);
              Navigator.pushNamed(context, 'newTodo');
            },
          ),
        ),
      ),
    );
  }
}
