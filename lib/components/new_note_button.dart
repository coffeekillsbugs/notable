import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../configs/colors.dart';
import '../providers/flag_provider.dart';

class NoteButton extends StatefulWidget {
  final Function toggleVisibility;
  NoteButton({Key key, @required this.toggleVisibility}) : super(key: key);
  @override
  NoteButtonState createState() => NoteButtonState();
}

class NoteButtonState extends State<NoteButton>
    with SingleTickerProviderStateMixin {
  AnimationController noteController;
  Animation<double> noteAnimation;

  @override
  void initState() {
    super.initState();

    noteController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {}
          });
    noteAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        curve: Curves.elasticInOut,
        parent: noteController,
        reverseCurve: Curves.elasticInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _change = Provider.of<FlagProvider>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, left: _width - 80),
      child: AnimatedBuilder(
        animation: noteController,
        builder: (context, child) => Transform.scale(
          scale: noteAnimation.value,
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: 60.0,
              width: 60.0,
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
              child: Icon(
                AntDesign.edit,
                color: AppColor.carribeanGreen,
                size: 25.0,
              ),
            ),
            onTap: () {
              widget.toggleVisibility(_change);
              Navigator.pushNamed(context, 'newNote');
            },
          ),
        ),
      ),
    );
  }
}
