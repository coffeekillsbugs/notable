import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';
import '../widgets/white_button.dart';
import '../widgets/black_button.dart';
import '../sigma_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isCollapsed;

  @override
  Widget build(BuildContext context) {
    _isCollapsed = Provider.of<SigmaProvider>(context).isFABCollapsed;

    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      body: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            // controller: _homeController,
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
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                ),
              ),
              SliverFillRemaining(),
            ],
          ),
          // >>> Todolist Button
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            bottom: _isCollapsed ? 16.0 : 160.0,
            right: 16.0,
            child: BlackButton(kIcon: Icons.check_box_rounded),
          ),
          // >>> Note button
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            bottom: _isCollapsed ? 16.0 : 88.0,
            right: 16.0,
            child: BlackButton(kIcon: Icons.edit),
          ),
          // >>> Add Button
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: WhiteButton(
              kOnTap: () {
                Provider.of<SigmaProvider>(context, listen: false)
                    .changeTodoPadding();
              },
              kIcon: Icons.add,
              kSize: 28.0,
            ),
          )
        ],
      ),
      // floatingActionButton: Stack(
      //   // mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     BlackButton(kIcon: Icons.edit),
      //     SizedBox(width: 16.0),
      //     AnimatedPadding(
      //       duration: Duration(milliseconds: 200),
      //       padding: EdgeInsets.only(bottom: Provider.of<SigmaProvider>(context).todoPadding),
      //       child: BlackButton(kIcon: Icons.check_box_outline_blank_rounded)),
      //     SizedBox(width: 16.0),
      //     WhiteButton(kIcon: Icons.add, kSize: 28.0),
      //   ],
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
