import 'dart:async';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:sigma/view_models/todo_view_model.dart';
import 'package:sigma/services/sigma_provider.dart';
import 'package:sigma/theme/colors.dart';

class CompactTodoView extends StatefulWidget {
  final int kIndex;

  CompactTodoView({
    required this.kIndex,
  });
  @override
  _CompactTodoViewState createState() => _CompactTodoViewState();
}

class _CompactTodoViewState extends State<CompactTodoView> {
  bool isTodoCollapsed = true;
  late TodoViewModel todoViewModel;
  late SigmaProvider sigmaProviderFalse;

  @override
  Widget build(BuildContext context) {
    sigmaProviderFalse = Provider.of<SigmaProvider>(context, listen: false);
    todoViewModel = TodoViewModel.getFromHive(widget.kIndex);
    return Dismissible(
      background: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Icon(
          Icons.edit,
          color: AppColor.darkGrey,
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(16.0),
        color: Colors.red,
        child: Icon(
          Icons.delete_rounded,
          color: AppColor.darkGrey,
        ),
      ),
      key: Key(todoViewModel.dateCreated.toString()),
      direction:
          isTodoCollapsed ? DismissDirection.horizontal : DismissDirection.none,
      dismissThresholds: {
        DismissDirection.endToStart: 0.1,
      },
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return _deleteConfirmationDialog(habitName: todoViewModel.title);
        } else {
          sigmaProviderFalse.updateSelectedIndex(widget.kIndex);
          sigmaProviderFalse.updateEditMode();
          Navigator.pushNamed(context, 'TodoScreen');
        }
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          todoViewModel.deleteInHive(widget.kIndex);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
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
                        todoViewModel.title,
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
                        isTodoCollapsed
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                          height:
                              todoViewModel.todoItemList!.isEmpty ? 100.0 : 240.0,
                          // color: Colors.red,
                          child: todoViewModel.todoItemList!.isEmpty
                              ? Container(
                                  alignment: Alignment.center,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: 'Huh?\n',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        TextSpan(
                                          text:
                                              'The list is empty. Did you forget to add items?',
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor: Colors.white,
                                        onTap: () {
                                          setState(() {
                                            todoViewModel
                                                .changeTodoItemState(
                                                    todoViewModel.dateCreated, index);
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          // color: Colors.green,
                                          child: Text(
                                            todoViewModel.todoItemList![index].todoItem,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontSize: 16.0,
                                                  decoration: todoViewModel.todoItemList![index]
                                                          .isDone? TextDecoration
                                                          .lineThrough
                                                      : null,
                                                  color: todoViewModel.todoItemList![index]
                                                          .isDone
                                                      ? Colors.white38
                                                      : Colors.white,
                                                ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: todoViewModel.todoItemList!.length,
                                ),
                        ),
                        SizedBox(height: 8.0),
                        // >>> Date Created
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            dateFormat(todoViewModel.dateCreated),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
            ],
          ),
        ),
      ),
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

  Future<bool?> _deleteConfirmationDialog({String? habitName}) async {
    return showDialog<bool>(
      // barrierColor: AppColor.darkGrey.withOpacity(0.9),
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Delete?',
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Text(
                  'You\'re about to delete \"$habitName\".',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'This action is not reversible.',
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text(
                'YES',
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text(
                'NO',
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}
