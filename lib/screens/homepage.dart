import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../view_models/note_view_model.dart';
import '../sigma_provider.dart';
import '../theme/colors.dart';
import '../widgets/sigma_button.dart';
import '../widgets/note_button.dart';
import '../views/compact_note_view.dart';
import '../views/compact_todo_view.dart';
import '../models/sigma_note.dart';
import '../repository/hive_provider.dart';
import '../services/search_delegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool toDelete;
  bool temp = true;

  SigmaProvider sigmaProviderFalse;
  HiveProvider hiveProvider = HiveProvider();
  NoteViewModel noteViewModel = NoteViewModel();

  @override
  Widget build(BuildContext context) {
    sigmaProviderFalse = Provider.of<SigmaProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            toolbarHeight: 80.0,
            expandedHeight: 120.0,
            backgroundColor: AppColor.darkGrey,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Home',
                textScaleFactor: 0.9,
                style: Theme.of(context).textTheme.headline4,
              ),
              titlePadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: Hive.box<SigmaNote>('sigmaNotes').listenable(),
            builder: (context, Box<SigmaNote> note, widget) {
              if (note.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline6,
                        children: [
                          TextSpan(
                            text: 'Such Empty.\n',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          TextSpan(
                            text: 'Try adding a few notes.',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (note.getAt(index).noteType == NoteType.note) {
                      SigmaNote noteObject = note.getAt(index);
                      return GestureDetector(
                        onTap: () {
                          sigmaProviderFalse.updateSelectedIndex(index);
                          Navigator.pushNamed(context, 'NoteView');
                        },
                        child: Dismissible(
                          background: Container(color: Colors.white),
                          secondaryBackground: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(16.0),
                            color: Colors.white,
                            child: Icon(
                              Icons.delete_rounded,
                              color: AppColor.darkGrey,
                            ),
                          ),
                          key: Key(noteObject.dateCreated.toString()),
                          direction: DismissDirection.endToStart,
                          // dismissThresholds: Map<DismissDirection.endToStart: 4.0>,
                          confirmDismiss: (direction) async {
                            return _deleteConfirmationDialog(habitName: noteObject.title);
                          },
                          onDismissed: (direction) {
                            noteViewModel.deleteFromHiveProvider(index);
                          },
                          child: CompactNoteView(noteObject: noteObject),
                        ),
                      );
                    } else {
                      SigmaNote todoObject = note.getAt(index);
                      return GestureDetector(
                        onTap: () {
                          sigmaProviderFalse.updateSelectedIndex(index);
                          Navigator.pushNamed(context, 'TodoView');
                        },
                        child: Dismissible(
                          background: Container(color: Colors.white),
                          secondaryBackground: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(16.0),
                            color: Colors.white,
                            child: Icon(
                              Icons.delete_rounded,
                              color: AppColor.darkGrey,
                            ),
                          ),
                          key: Key(todoObject.dateCreated.toString()),
                          direction: DismissDirection.endToStart,
                          // dismissThresholds: Map<DismissDirection.endToStart: 4.0>,
                          confirmDismiss: (direction) async {
                            return _deleteConfirmationDialog(habitName: todoObject.title);
                          },
                          onDismissed: (direction) {
                            noteViewModel.deleteFromHiveProvider(index);
                          },
                          child: CompactTodoView(todoObject: todoObject),
                        ),
                      );
                    }
                  },
                  childCount: note.length,
                ),
              );
            },
          ),
          SliverFillRemaining(
            child: SizedBox(height: 80.0),
            hasScrollBody: false,
          ),
        ],
      ),
      floatingActionButton: SigmaButton(
        kHeroTag: 'sigma',
        kIcon: Icons.keyboard_arrow_up_rounded,
        kOnPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => Container(
              height: 258.0,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    child: Container(
                      height: 5.0,
                      width: 36.0,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //New Note Button
                      NoteButton(
                        kOnTap: () {
                          Navigator.popAndPushNamed(context, 'NoteScreen');
                        },
                        kIcon: Icons.edit,
                        kLabel: 'New Note',
                      ),
                      SizedBox(width: 16.0),
                      //Other Buttons
                      Container(
                        // color: Colors.green,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SigmaButton(
                              kHeroTag: 'search',
                              kOnPressed: () async {
                                final selectedIndex = await showSearch(context: context, delegate: NoteSearch(Theme.of(context).textTheme.headline6.copyWith(color: AppColor.darkGrey),),);

                                if (selectedIndex != null) {
                                  NoteType noteType;
                                  sigmaProviderFalse.updateSelectedIndex(selectedIndex);
                                  noteType = hiveProvider.noteType(selectedIndex);
                                  Navigator.popAndPushNamed(context, noteType == NoteType.note ? 'NoteView' : 'TodoView');
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              kIcon: Icons.search,
                              kIconColor: Colors.white,
                              kBackgroundColor: AppColor.overlayTwelve,
                            ),
                            SizedBox(height: 16.0),
                            SigmaButton(
                              kHeroTag: 'about',
                              kOnPressed: () {
                                Navigator.popAndPushNamed(context, 'About');
                              },
                              kIcon: Icons.info_outline_rounded,
                              kIconColor: Colors.white,
                              kBackgroundColor: AppColor.overlayTwelve,
                            ),
                            SizedBox(height: 16.0),
                            SigmaButton(
                              kOnPressed: () {
                                Navigator.pop(context);
                              },
                              kHeroTag: 'sigma',
                              kIcon: Icons.keyboard_arrow_down_rounded,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      // New ToDo Button
                      NoteButton(
                        kOnTap: () {
                          Navigator.popAndPushNamed(context, 'TodoScreen');
                        },
                        kIcon: Icons.check_box_rounded,
                        kLabel: 'New ToDo',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: AppColor.overlayFive,
            barrierColor: AppColor.darkGrey.withOpacity(0.9),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<bool> _deleteConfirmationDialog({String habitName}) async {
    return showDialog<bool>(
            barrierColor: AppColor.darkGrey.withOpacity(0.9),
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: AppColor.overlayTwelve,
                title: Text('Delete?', style: Theme.of(context).textTheme.headline6),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Text('You\'re about to delete \"$habitName\".', style: Theme.of(context).textTheme.subtitle2),
                    ),
                    SizedBox(height: 16.0),
                    Text('This action is not reversible.', style: Theme.of(context).textTheme.subtitle2),
                  ],
                ),
                actions: [
                  FlatButton(
                    child: Text('YES', style: Theme.of(context).textTheme.button),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  FlatButton(
                    child: Text('NO', style: Theme.of(context).textTheme.button),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              );
            }) ??
        false;
  }
}