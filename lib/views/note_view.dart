import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sigma/widgets/sigma_button.dart';
import 'package:sigma/services/sigma_provider.dart';
import 'package:sigma/view_models/note_view_model.dart';
import 'package:sigma/theme/colors.dart';

class NoteView extends StatefulWidget {
  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  late NoteViewModel noteViewModel;
  late SigmaProvider sigmaProviderFalse, sigmaProvider;

  @override
  Widget build(BuildContext context) {
    sigmaProviderFalse = Provider.of<SigmaProvider>(context, listen: false);
    sigmaProvider = Provider.of<SigmaProvider>(context);

    noteViewModel = NoteViewModel.getFromHive(sigmaProvider.selectedIndex);
    // >>> Note View
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    noteViewModel.title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    dateFormat(noteViewModel.dateCreated),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(height: 16.0),
                Flexible(
                  child: Container(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          noteViewModel.noteBody!,
                          style: Theme.of(context).textTheme.bodyText1,
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SigmaButton(
                  kHeroTag: 'white',
                  kOnPressed: () => Navigator.pop(context),
                  kIcon: Icons.chevron_left_rounded,
                  kSize: 40.0,
                ),
                SizedBox(width: 16.0),
                SigmaButton(
                  kHeroTag: 'blackNote',
                  kOnPressed: () {
                    sigmaProviderFalse.updateEditMode();
                    Navigator.popAndPushNamed(context, 'NoteScreen');
                  },
                  kIcon: Icons.edit,
                  kIconColor: Colors.white,
                  kBackgroundColor: AppColor.overlaySeven,
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
