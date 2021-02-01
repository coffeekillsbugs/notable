import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/sigma_note.dart';
import '../services/sigma_provider.dart';
import '../view_models/todo_view_model.dart';
import '../theme/colors.dart';
import '../widgets/sigma_button.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  TodoViewModel todoViewModel = TodoViewModel();
  SigmaNote todoObject = SigmaNote();

  SigmaProvider sigmaProviderFalse, sigmaProvider;

  @override
  Widget build(BuildContext context) {
    sigmaProviderFalse = Provider.of<SigmaProvider>(context, listen: false);
    sigmaProvider = Provider.of<SigmaProvider>(context);

    todoObject = todoViewModel.getFromHiveProvider(sigmaProvider.selectedIndex);

    return Scaffold(
      backgroundColor: AppColor.darkGrey,
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
                  todoObject.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              SizedBox(height: 16.0),
              // >>> Current Date
              Container(
                child: Text(
                  dateFormat(todoObject.dateCreated),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(height: 16.0),
              // >>> To Do list layout
              Flexible(
                child: Container(
                  child: todoObject.todoItems.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white), children: [
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
                              itemCount: todoObject.todoItems.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    todoViewModel.changeItemState(todoObject, index);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 16.0),
                                    // color: Colors.green,
                                    child: Text(
                                      todoObject.todoItems[index].todoItem,
                                      style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20.0,decoration: todoObject.todoItems[index].isDone ? TextDecoration.lineThrough : null,),

                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
