import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../view_models/note_view_model.dart';
import '../services/sigma_provider.dart';
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
                    if (note.getAt(index).noteType == NoteType.note) {
                      SigmaNote noteObject = note.getAt(index);
                      return GestureDetector(
                        onTap: () {
                          sigmaProviderFalse.updateSelectedIndex(index);
                          Navigator.pushNamed(context, 'NoteView');
                        },
                        child: Dismissible(
                          background: Container(
                              // color: Colors.white,
                              ),
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
                          dismissThresholds: {
                            DismissDirection.endToStart: 0.1,
                          },
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
                          background: Container(
                              // color: Colors.white,
                              ),
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
                          dismissThresholds: {
                            DismissDirection.endToStart: 0.1,
                          },
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
      floatingActionButton: Transform.rotate(
        angle: -0.785,
        // angle: 0,
        child: SigmaButton(
          kHeroTag: 'sigma',
          kIcon: Icons.add,
          kSize: 36.0,
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: AppColor.overlayTwelve,
        shape: BottomAppBarNotch(),
        child: Stack(
          children: [
            // >>> Bottom app bar
            Container(
              height: 72.0,
              padding: EdgeInsets.only(
                left: 128.0,
                right: 64.0 + 28.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // >>> Info button
                  MiniBox(
                    kIcon: Icons.info,
                    kOffset: Offset(6.0, 6.0),
                    kOnTap: () {
                      Navigator.pushNamed(context, 'About');
                    },
                  ),
                  // >>> Setting Button
                  MiniBox(
                    kIcon: Icons.settings,
                    kOffset: Offset(-6.0, 6.0),
                    kOnTap: () {
                      // TODO : Settings?
                    },
                  ),
                  // >>> Search
                  MiniBox(
                    kIcon: Icons.search_rounded,
                    kOffset: Offset(-6.0, -6.0),
                    kOnTap: () async {
                      final selectedIndex = await showSearch(
                        context: context,
                        delegate: NoteSearch(),
                      );

                      if (selectedIndex != null) {
                        NoteType noteType;
                        sigmaProviderFalse.updateSelectedIndex(selectedIndex);
                        noteType = hiveProvider.noteType(selectedIndex);
                        Navigator.pushNamed(context, noteType == NoteType.note ? 'NoteView' : 'TodoView');
                      }
                    },
                  ),
                ],
              ),
            ),
            // >>> Sigma symbol
            ClipPath(
              clipper: SigmaClipper(),
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(
                  right: 8.0,
                  bottom: 8.0,
                ),
                color: Colors.white,
                height: 72.0,
                child: Image(
                  image: AssetImage('assets/images/sigma_symbol.png'),
                  color: Colors.black45,
                  fit: BoxFit.contain,
                  height: 20.0,
                  width: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _deleteConfirmationDialog({String habitName}) async {
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
                  FlatButton(
                    child: Text(
                      'YES',
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'NO',
                    ),
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

class MiniBox extends StatelessWidget {
  final IconData kIcon;
  final Offset kOffset;
  final Function kOnTap;

  MiniBox({@required this.kIcon, this.kOffset, @required this.kOnTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: kOnTap,
      child: Transform.rotate(
        angle: -0.785,
        child: Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: AppColor.overlayTwelve,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: kOffset,
                blurRadius: 6.0,
              )
            ],
          ),
          child: Transform.rotate(
            angle: 0.785,
            child: Icon(kIcon),
          ),
        ),
      ),
    );
  }
}

class SigmaClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width + 8, 0)
      ..lineTo(size.width + 8, size.height)
      ..lineTo(size.width + 8 - size.height, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BottomAppBarNotch extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect guest) {
    // print('diagonal : $diagonal\nguest width : ${guest.width}\nguest height : ${guest.height}\nhost height : ${host.height}\nhost width : ${host.width}\nguest center : ${guest.center}');
    return Path()
      ..moveTo(guest.center.dx - (guest.width / 2) - 20, guest.center.dy)
      ..lineTo(guest.center.dx, guest.center.dy + (guest.width / 2) + 20)
      ..lineTo(guest.center.dx + (guest.width / 2) + 20, guest.center.dy)
      ..lineTo(host.width, 0)
      ..lineTo(host.width, host.height)
      ..lineTo(guest.width, host.height)
      ..lineTo(guest.width * 2, 0);
  }
}
