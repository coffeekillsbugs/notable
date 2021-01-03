import 'package:flutter/material.dart';

import '../widgets/white_button.dart';
import '../widgets/black_button.dart';
import '../theme/colors.dart';

class NewNoteScreen extends StatefulWidget {
  @override
  _NewNoteScreenState createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  FocusNode _description;
  String _kDateTime;

  @override
  void initState() {
    super.initState();

    _description = FocusNode();
  }

  @override
  void dispose() {
    _description.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _kDateTime = dateFormat(DateTime.now());
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                // color: Colors.white,
                child: TextField(
                  autofocus: true,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.headline3,
                  cursorColor: Colors.white,
                  cursorRadius: Radius.circular(10.0),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.white60),
                  ),
                  onSubmitted: (text) {
                    _description.requestFocus();
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  _kDateTime,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                // color: Colors.white,
                child: TextField(
                  // autofocus: true,
                  focusNode: _description,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: Theme.of(context).textTheme.bodyText1,
                  cursorColor: Colors.white,
                  cursorRadius: Radius.circular(10.0),
                  cursorHeight: 20.0,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Whats on your mind?',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white60),
                  ),
                ),
              ),
              SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          WhiteButton(
            kOnTap: () => Navigator.pop(context),
            kIcon: Icons.chevron_left_rounded,
            kSize: 40.0,
          ),
          SizedBox(width: 16.0),
          BlackButton(kIcon: Icons.save),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  String dateFormat(DateTime dateTime) {
    String _dateTime;

    _dateTime =
        '${dateTime.day} ${monthName(dateTime.month)}, ${dateTime.year}';

    return _dateTime;
  }

  String monthName(int month) {
    switch (month) {
      case 1:
        return 'January';

      case 2:
        return 'February';

      case 3:
        return 'March';

      case 4:
        return 'April';

      case 5:
        return 'May';

      case 6:
        return 'June';

      case 7:
        return 'July';

      case 8:
        return 'August';

      case 9:
        return 'September';

      case 10:
        return 'October';

      case 11:
        return 'November';

      case 12:
        return 'December';

      default:
        return 'January';
    }
  }
}
