import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sigma/models/sigma_note.dart';
import 'package:sigma/view_models/todo_view_model.dart';
import 'package:sigma/services/sigma_provider.dart';
import 'package:sigma/theme/colors.dart';
import 'package:sigma/widgets/sigma_button.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  double _bottomPadding = 100.0;
  bool isEditMode = false;
  // int? selectedIndex;

  // late DateTime dateTime;
  // late String _kDateTime;
  late FocusNode _todoItemFocusNode, _titleFocusNode;

  late TextEditingController _todoItemController, _titleController;

  late TodoViewModel todoViewModel;
  // late SigmaNote todoObject;
  late SigmaProvider sigmaProvider;

  // late List<TodoItemModel>? _todoItemList;

  @override
  void initState() {
    super.initState();

    todoViewModel = TodoViewModel();
    _todoItemController = TextEditingController();
    _titleController = TextEditingController(text: todoViewModel.title);
    _titleController.addListener(() {});
    _todoItemFocusNode = FocusNode();
    _titleFocusNode = FocusNode();
    _titleFocusNode.addListener(() {
      if (_titleFocusNode.hasFocus) {
        setState(() {
          // Future.delayed(Duration(seconds: 3));
          _bottomPadding = 16.0;
        });
      }
    });
    _todoItemFocusNode.addListener(() {
      if (_todoItemFocusNode.hasFocus) {
        // Future.delayed(Duration(seconds: 1));
        setState(() {
          _bottomPadding = 16.0;
        });
      }
    });
    // _todoItemList = [];
    _titleFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _todoItemController.dispose();
    _todoItemFocusNode.removeListener(() {});
    _todoItemFocusNode.dispose();
    _titleFocusNode.removeListener(() {});
    _titleFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sigmaProvider = Provider.of<SigmaProvider>(context, listen: false);

    if (sigmaProvider.isEditMode) {
      isEditMode = sigmaProvider.isEditMode;
      sigmaProvider.updateEditMode();

      todoViewModel = TodoViewModel.getFromHive(sigmaProvider.selectedIndex);
      _titleController.text = todoViewModel.title;
    }

    if (MediaQuery.of(context).viewInsets.bottom == 0.0) {
      _bottomPadding = 100.0;
    } else {
      _bottomPadding = 16.0;
    }

    // >>> To-do Screen
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.0),
                  // >>> Title textfield
                  Container(
                    child: TextField(
                      // autofocus: true,
                      focusNode: _titleFocusNode,
                      controller: _titleController,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      autocorrect: false,
                      style: Theme.of(context).textTheme.headline3,
                      cursorColor: Colors.white,
                      cursorRadius: Radius.circular(10.0),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white60),
                      ),
                      onSubmitted: (text) {
                        _todoItemFocusNode.requestFocus();
                      },
                    ),
                  ),
                  // >>> Current Date
                  Container(
                    child: Text(
                      dateFormat(todoViewModel.dateCreated),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // >>> To Do list layout
                  Flexible(
                    child: Container(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: todoViewModel.todoItemList!.length,
                            itemBuilder: (context, index) {
                              if (todoViewModel.todoItemList!.isEmpty) {
                                return Container();
                              }

                              return Container(
                                alignment: Alignment.center,
                                // color: Colors.white24,
                                height: 56.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        child: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            todoViewModel.todoItemList![index].todoItem,
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.white,
                                      borderRadius: BorderRadius.circular(28.0),
                                      onTap: () {
                                        setState(() {
                                          todoViewModel.todoItemList!.removeAt(index);
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
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white24,
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 56.0,
                            // width: double.infinity,
                            color: AppColor.darkGrey,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: AppColor.overlaySeven, borderRadius: BorderRadius.circular(5.0)),
                              child: TextField(
                                focusNode: _todoItemFocusNode,
                                controller: _todoItemController,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.sentences,
                                autocorrect: false,
                                style: Theme.of(context).textTheme.bodyText1,
                                cursorColor: Colors.white,
                                cursorRadius: Radius.circular(10.0),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'What\'s next?',
                                  hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white60),
                                ),
                                onSubmitted: (text) {
                                  if (text.isNotEmpty) {
                                    setState(() {
                                      // todoObject!.todoItems!.add(TodoItemModel(todoItem: _todoItemController!.text, isDone: false));
                                      todoViewModel.todoItemList!.insert(0, TodoItemModel(todoItem: _todoItemController.text, isDone: false));
                                      _todoItemController.text = '';
                                      _todoItemFocusNode.requestFocus();
                                    });
                                  } else {
                                    print('inside else');
                                    setState(() {
                                      _bottomPadding = 100.0;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        // New To Do item add button
                        SigmaButton(
                          kHeroTag: 'add',
                          kOnPressed: () {
                            print('add button pressed');
                            if (_todoItemController.text.isNotEmpty) {
                              setState(() {
                                // todoObject!.todoItems!.add(TodoItemModel(todoItem: _todoItemController!.text, isDone: false));
                                todoViewModel.todoItemList!.insert(0, TodoItemModel(todoItem: _todoItemController.text, isDone: false));
                                _todoItemController.text = '';
                                _todoItemFocusNode.requestFocus();
                              });
                            }
                          },
                          kIcon: Icons.add,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _bottomPadding),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SigmaButton(
                  kHeroTag: 'white',
                  kOnPressed: () => Navigator.pop(context),
                  kIcon: Icons.chevron_left_rounded,
                ),
                SizedBox(width: 16.0),
                SigmaButton(
                  kHeroTag: 'blackTodo',
                  kOnPressed: () {
                    if (_titleController.text.isEmpty) {
                      _emptyFieldWarning();
                    } else {
                      if (isEditMode) {
                        isEditMode = false;
                        todoViewModel.updateToHive(
                          sigmaProvider.selectedIndex,
                          _titleController.text,
                          todoViewModel.dateCreated,
                          todoViewModel.noteType,
                          todoViewModel.todoItemList!,
                        );
                        // Show updated
                        Navigator.popAndPushNamed(context, 'TodoView');
                      } else {
                        todoViewModel.writeToHive(
                            _titleController.text,
                            todoViewModel.dateCreated,
                            todoViewModel.noteType,
                            todoViewModel.todoItemList!,
                        );
                        Navigator.pop(context);
                      }
                    }
                  },
                  kIcon: Icons.save,
                  kIconColor: Colors.white,
                  kBackgroundColor: AppColor.overlayTwelve,
                ),
              ],
            ),
          ),
        ),
      ],
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

  Future<void> _emptyFieldWarning() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Hmm...',
          ),
          content: Text(
            '...seems you forgot the title.',
          ),
          actions: [
            TextButton(
              child: Text(
                'SILLY ME',
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
