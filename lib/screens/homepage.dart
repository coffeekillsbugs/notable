import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:sigma/services/sigma_provider.dart';
import 'package:sigma/theme/colors.dart';
import 'package:sigma/widgets/sigma_button.dart';
import 'package:sigma/widgets/note_button.dart';
import 'package:sigma/views/compact_note_view.dart';
import 'package:sigma/views/compact_todo_view.dart';
import 'package:sigma/models/sigma_note.dart';
import 'package:sigma/repository/hive_provider.dart';
import 'package:sigma/services/search_delegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SigmaProvider sigmaProviderFalse;
  HiveProvider hiveProvider = HiveProvider();


  @override
  Widget build(BuildContext context) {
    sigmaProviderFalse = Provider.of<SigmaProvider>(context, listen: false);
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            toolbarHeight: 80.0,
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Home',
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
                    if (note.getAt(index)!.noteType == NoteType.note) {
                      // SigmaNote noteObject = note.getAt(index);
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            sigmaProviderFalse.updateSelectedIndex(index);
                            Navigator.pushNamed(context, 'NoteView');
                          },
                          // child: CompactNoteView(noteObject: noteObject),
                          child: CompactNoteView(kIndex: index),
                        ),
                      );
                    } else {
                      // SigmaNote todoObject = note.getAt(index);
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            sigmaProviderFalse.updateSelectedIndex(index);
                            Navigator.pushNamed(context, 'TodoView');
                          },
                          child: CompactTodoView(kIndex: index),
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
                                final selectedIndex = await showSearch(
                                  context: context,
                                  delegate: NoteSearch(),
                                );

                                if (selectedIndex != null) {
                                  NoteType? noteType;
                                  sigmaProviderFalse.updateSelectedIndex(selectedIndex);
                                  noteType = hiveProvider.noteType(selectedIndex);
                                  // Navigator.popAndPushNamed(context, noteType == NoteType.note ? 'NoteView' : 'TodoView');
                                  Navigator.of(context).pushNamed(noteType == NoteType.note ? 'NoteView' : 'TodoView');
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              kIcon: Icons.search,
                              kIconColor: Colors.white,
                              kBackgroundColor: AppColor.overlayEight,
                            ),
                            SizedBox(height: 16.0),
                            SigmaButton(
                              kHeroTag: 'about',
                              kOnPressed: () {
                                Navigator.popAndPushNamed(context, 'About');
                              },
                              kIcon: Icons.info_outline_rounded,
                              kIconColor: Colors.white,
                              kBackgroundColor: AppColor.overlayEight,
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
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Route _createNewRoute(NoteType noteType) {
  //   return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => noteType == NoteType.note ? 'NoteView' : 'TodoView', transitionsBuilder: );
  // }
}
