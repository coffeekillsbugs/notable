import 'package:flutter/material.dart';
import 'package:sigma/view_models/compact_todo_view_model.dart';

import '../theme/colors.dart';
import '../models/sigma_note.dart';

class CompactTodoView extends StatefulWidget {
  final SigmaNote todoObject;

  CompactTodoView({
    @required this.todoObject,
  });
  @override
  _CompactTodoViewState createState() => _CompactTodoViewState();
}

class _CompactTodoViewState extends State<CompactTodoView> {
  bool isTodoCollapsed = true;
  CompactTodoViewModel compactTodoViewModel = CompactTodoViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: AppColor.overlaySeven,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            // >>> Title, Collapse and Expand button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    child: Text(
                      widget.todoObject.title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                InkWell(
                  splashColor: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {
                    setState(() {
                      if (isTodoCollapsed) {
                        isTodoCollapsed = false;
                      } else {
                        isTodoCollapsed = true;
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Icon(
                      isTodoCollapsed ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
            isTodoCollapsed
                ? Container()
                : Column(
                    children: [
                      // >>> Body
                      Container(
                        alignment: Alignment.topLeft,
                        // color: Colors.red,
                        height: widget.todoObject.todoItems.isEmpty ? 100.0 : 240.0,
                        // color: Colors.red,
                        child: widget.todoObject.todoItems.isEmpty
                            ? Container(
                                alignment: Alignment.center,
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
                                    children: [
                                      TextSpan(
                                        text: 'Huh?\n',
                                        style: Theme.of(context).textTheme.headline6,
                                      ),
                                      TextSpan(
                                        text: 'The list is empty. Did you forget to add items?',
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : ListView.builder(
                                // padding: EdgeInsets.symmetric(vertical: 16.0),
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.white,
                                      onTap: () {
                                        setState(() {
                                          compactTodoViewModel.changeItemState(widget.todoObject, index);
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 16.0),
                                        // color: Colors.green,
                                        child: Text(
                                          widget.todoObject.todoItems[index].todoItem,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                                fontSize: 16.0,
                                                decoration: widget.todoObject.todoItems[index].isDone ? TextDecoration.lineThrough : null,
                                              ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: widget.todoObject.todoItems.length,
                              ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      // >>> Date Created
                      Container(
                        alignment: Alignment.centerLeft,
                        // color: Colors.green,
                        child: Text(
                          dateFormat(widget.todoObject.dateCreated),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  String dateFormat(DateTime dateTime) {
    String _dateTime;

    _dateTime = '${dateTime.day} ${monthName(dateTime.month)}, ${dateTime.year}';

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
