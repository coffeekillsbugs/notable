import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/gradient_background.dart';
import '../widgets/fab_blur.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // >>> Gradient Background
        GradientBackground(),
        // >>> Scroll View
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              primary: true,
              toolbarHeight: 80.0,
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'My Notes',
                  textScaleFactor: 0.9,
                  style: Theme.of(context).textTheme.headline4,
                ),
                titlePadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                background: Container(color: AppColor.deepBlue),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      height: 240.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Games to play',
                                textScaleFactor: 1.0,
                                overflow: TextOverflow.fade,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Container(
                                padding: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: AppColor.deepBlue,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: Offset(0.0, 12.0),
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.more_vert,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Flexible(
                            child: Text(
                              'Shadow of War, Destiny2, Shadow of the Tome Raider, Devil May Cry 5\n\nWatch Dogs Legion\n\nCyberpunk 2077, Dues Ex Machina, Red Dead Redemption Series\nBlair Witch Project, Batman Arkham Trilogy, Grand Theft Auto Five',
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 6,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButtonBlur(Icons.info_outline),
                SizedBox(width: 8.0),
                FloatingActionButtonBlur(Icons.edit),
                SizedBox(width: 8.0),
                FloatingActionButtonBlur(Icons.check_box_outline_blank_rounded),
              ],
            ),
          ),
        ),
      ],
    );
  }
}




