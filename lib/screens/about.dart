import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:sigma/widgets/sigma_button.dart';
import 'package:sigma/theme/colors.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: false,
            primary: true,
            toolbarHeight: 80.0,
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'About',
                style: Theme.of(context).textTheme.headline4,
              ),
              titlePadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              // background: Container(color: AppColor.darkGrey),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                SizedBox(height: 32.0),
                // >>> Icon and Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(24.0),
                      height: 110.0,
                      width: 110.0,
                      decoration: BoxDecoration(
                        color: AppColor.overlaySeven,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Image(
                        image: AssetImage('assets/images/sigma_symbol.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sigma',
                            // textScaleFactor: 1.0,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'v0.5.3-alpha',
                            // textScaleFactor: 1.0,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Write notes, create todo\'s.',
                            // textScaleFactor: 1.0,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                // >>> External links
                KitKatButton(
                    kText: 'SHARE',
                    kOnTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Work in progress. Stay tuned ; ).',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        backgroundColor: AppColor.overlayEight,
                      ));
                    }),
                KitKatButton(
                  kText: 'FEEDBACK',
                  kOnTap: () {
                    _externalLink('mailto:arthurexcalibur9@protonmail.com?subject=Sigma%20Feedback&body=What%20are%20your%20thoughts?');
                  },
                ),
                KitKatButton(
                  kText: 'LICENSES',
                  kOnTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Work in progress. Stay tuned ; ).',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      backgroundColor: AppColor.overlayEight,
                    ));
                  },
                ),
                KitKatButton(
                  kText: 'REPORT BUG',
                  kOnTap: () {
                    _externalLink('mailto:arthurexcalibur9@protonmail.com?subject=Reporting%20Bug&body=What%20seems%20broken?');
                  },
                ),
                SizedBox(height: 96.0),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SigmaButton(
        kHeroTag: 'about',
        kOnPressed: () {
          Navigator.pop(context);
        },
        kIcon: Icons.chevron_left_rounded,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _externalLink(String url) async {
    // const url = link;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class KitKatButton extends StatelessWidget {
  final String kText;
  final Function? kOnTap;

  KitKatButton({
    required this.kText,
    this.kOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        onTap: kOnTap as void Function()?,
        child: Container(
          alignment: Alignment.center,
          height: 56.0,
          child: Text(
            kText,
            textScaleFactor: 1.0,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
