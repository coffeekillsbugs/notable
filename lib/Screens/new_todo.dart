import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/white_button.dart';
import '../widgets/black_button.dart';

class NewTodoScreen extends StatefulWidget {
  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  FocusNode _todoItem;
  String _kDateTime;
  List<String> _dummyList = List();

  @override
  void initState() {
    super.initState();

    _todoItem = FocusNode();
  }

  // @override
  // void dispose() {
  //   _description.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    _kDateTime = dateFormat(DateTime.now());
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.0),
                // >>> Title textfield
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 32.0),
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
                      _todoItem.requestFocus();
                    },
                  ),
                ),
                // >>> Current Date
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    _kDateTime,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(height: 16.0),
                // >>> To Do list layout
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _dummyList.length,
                          itemBuilder: (context, index) {
                            if(_dummyList.isEmpty) {
                              return Container();
                            }

                            return Container(
                              alignment: Alignment.center,
                              // color: Colors.white24,
                              height: 56.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _dummyList[index],
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20.0),
                                  ),
                                  InkWell(
                                    splashColor: Colors.white,
                                    borderRadius: BorderRadius.circular(28.0),
                                    onTap: () {
                                      setState(() {
                                        _dummyList.removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 56.0,
                                      width: 56.0,
                                      decoration: BoxDecoration(
                                        // color: Colors.white38,
                                        borderRadius: BorderRadius.circular(28.0),
                                      ),
                                      child: Icon(
                                        Icons.delete_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Divider(
                        color: Colors.white24,
                        thickness: 1.0,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 32.0),
                        // color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 56.0,
                                // width: double.infinity,
                                color: AppColor.darkGrey,
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: TextField(
                                    focusNode: _todoItem,
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    cursorColor: Colors.white,
                                    cursorRadius: Radius.circular(10.0),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'What\'s next?',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white60),
                                    ),
                                    onSubmitted: (text) {
                                      setState(() {
                                        _dummyList.add(text);
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            // New To Do item add button
                            WhiteButton(kIcon: Icons.add),
                          ],
                        ),
                      ),
                      // SizedBox(height: 72.0),
                    ],
                  ),
                ),
                SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          WhiteButton(kIcon: Icons.chevron_left_rounded, kSize: 40.0),
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
