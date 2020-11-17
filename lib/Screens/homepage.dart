import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/white_button.dart';
import '../widgets/black_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        // controller: _homeController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            primary: true,
            toolbarHeight: 80.0,
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Home',
                textScaleFactor: 0.9,
                style: Theme.of(context).textTheme.headline4,
              ),
              titlePadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            ),
          ),
          SliverFillRemaining(),
        ],
      ),
      floatingActionButton: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WhiteButton(kIcon: Icons.menu),
          SizedBox(width: 16.0),
          BlackButton(kIcon: Icons.edit),
          SizedBox(width: 16.0),
          BlackButton(kIcon: Icons.check_box_outline_blank_rounded),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  // void _homeControllerListener() {
  // //   print(_homeController.offset.isNegative);
  // //   bool isCollapsed = _homeController.offset.isNegative ? false : true;

  // //   if (_shouldColapse != isCollapsed) {
  // //     setState(() {
  // //       _shouldColapse = isCollapsed;
  // //     });
  // //   }
  // //   print('_shuc : $_shouldColapse');
  // }
}

// collpased -> false
// expanded -> true
