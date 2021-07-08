import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sigma/services/sigma_provider.dart';
import 'package:sigma/view_models/todo_view_model.dart';
import 'package:sigma/widgets/sigma_button.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  late TodoViewModel todoViewModel;
  late SigmaProvider sigmaProviderFalse, sigmaProvider;

  @override
  Widget build(BuildContext context) {
    sigmaProviderFalse = Provider.of<SigmaProvider>(context, listen: false);
    sigmaProvider = Provider.of<SigmaProvider>(context);

    todoViewModel = TodoViewModel.getFromHive(sigmaProvider.selectedIndex);

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
                  // >>> Title
                  Container(
                    child: Text(
                      todoViewModel.title,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(height: 16.0),
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
                      child: todoViewModel.todoItemList!.isEmpty
                          ? Container(
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white), children: [
                            TextSpan(
                              text: 'Hmm...\n',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            TextSpan(
                              text: 'Looks like you forgot to add items. Click on the edit button below to add.',
                            ),
                          ]),
                        ),
                      )
                          : SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: todoViewModel.todoItemList!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: Colors.white,
                                onTap: () {
                                  setState(() {
                                    todoViewModel.changeTodoItemState(todoViewModel.dateCreated, index);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  // color: Colors.green,
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      todoViewModel.todoItemList![index].todoItem,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 20.0,
                                        decoration: todoViewModel.todoItemList![index].isDone ? TextDecoration.lineThrough : null,
                                        color: todoViewModel.todoItemList![index].isDone ? Colors.white38 : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 88.0),
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
              children: [
                SigmaButton(
                  kHeroTag: 'back2',
                  kOnPressed: () => Navigator.pop(context),
                  kIcon: Icons.chevron_left_rounded,
                  kSize: 40.0,
                ),
                SizedBox(width: 16.0),
                SigmaButton(
                  kHeroTag: 'blackTodo',
                  kOnPressed: () {
                    sigmaProviderFalse.updateEditMode();
                    Navigator.popAndPushNamed(context, 'TodoScreen');
                  },
                  kIcon: Icons.edit,
                  kIconColor: Colors.white,
                  kBackgroundColor: Colors.white.withOpacity(0.12),
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
}
