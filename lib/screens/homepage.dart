import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../sigma_provider.dart';
import '../theme/colors.dart';
import '../widgets/sigma_button.dart';
import '../views/compact_note_view.dart';
import '../views/compact_todo_view.dart';
import '../models/sigma_note.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showOverlay = false;
  bool temp = true;

  SigmaProvider sigmaProviderFalse;

  @override
  Widget build(BuildContext context) {
    sigmaProviderFalse = Provider.of<SigmaProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      body: Stack(
        children: [
          CustomScrollView(
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
                  } else {
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
                                child: CompactNoteView(noteObject: noteObject));
                          } else {
                            SigmaNote todoObject = note.getAt(index);
                            return GestureDetector(
                                onTap: () {
                                  sigmaProviderFalse.updateSelectedIndex(index);
                                  Navigator.pushNamed(context, 'TodoView');
                                },
                                child: CompactTodoView(todoObject: todoObject));
                          }
                        },
                        childCount: note.length,
                      ),
                    );
                  }
                },
              ),
              SliverFillRemaining(
                child: SizedBox(height: 80.0),
                hasScrollBody: false,
              ),
            ],
          ),
          _showOverlay
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _showOverlay = false;
                    });
                  },
                  child: Container(
                    color: Colors.white.withOpacity(0.3),
                  ),
                )
              : Container(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedOpacity(
            // >>> New Todo Button
            duration: Duration(milliseconds: 200),
            opacity: _showOverlay ? 1.0 : 0.0,
            child: SigmaButton(
              kHeroTag: 'back2',
              kIcon: Icons.check_box_rounded,
              kOnPressed: () {
                if (_showOverlay) {
                  Navigator.pushNamed(context, 'TodoScreen');
                  setState(() {
                    _showOverlay = false;
                  });
                }
              },
              kIconColor: Colors.white,
              kBackgroundColor: AppColor.darkGrey,
            ),
          ),
          SizedBox(height: 16.0),
          // >>> New Note Button
          AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: _showOverlay ? 1.0 : 0.0,
            child: SigmaButton(
              kHeroTag: 'blackNote',
              kIcon: Icons.edit,
              kOnPressed: () {
                if (_showOverlay) {
                  Navigator.pushNamed(context, 'NoteScreen');
                  setState(() {
                    _showOverlay = false;
                  });
                }
              },
              kIconColor: Colors.white,
              kBackgroundColor: AppColor.darkGrey,
            ),
          ),
          // >>> Sigma Button
          SizedBox(height: 16.0),
          // TODO : replace icon with custom sigma icon
          SigmaButton(
            kHeroTag: 'white',
            kIcon: Icons.add,
            kOnPressed: () {
              setState(() {
                if (_showOverlay) {
                  _showOverlay = false;
                } else {
                  _showOverlay = true;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
