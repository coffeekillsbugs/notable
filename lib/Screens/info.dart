import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/gradient_background.dart';
import '../widgets/fab_blur.dart';
import '../theme/colors.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            primary: true,
            toolbarHeight: 150.0,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'About',
                textScaleFactor: 1.0,
                style: Theme.of(context).textTheme.headline3,
              ),
              titlePadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              background: Container(color: AppColor.deepBlue),
            ),
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.0),
                // >>> Icon and Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(24.0),
                      height: 110.0,
                      width: 110.0,
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0.0, 12.0),
                            blurRadius: 32.0,
                          ),
                        ],
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
                            textScaleFactor: 1.0,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'v1.0.0',
                            textScaleFactor: 1.0,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'A simple app.\nWrite notes, create todo\'s.',
                            textScaleFactor: 1.0,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                // >>> External links
                KitKatButton('SHARE'),
                KitKatButton('FEEDBACK'),
                KitKatButton('LICENSES'),
                KitKatButton('REPORT BUG'),
                SizedBox(height: 32.0),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 56.0,
                    width: 200.0,
                    child: GestureDetector(
                      onTap: _donate,
                      child: Image(
                        image: AssetImage('assets/images/donate.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 96.0),
              ],
            ),
          ),
          floatingActionButton:
              FloatingActionButtonBlur(Icons.chevron_left_rounded),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ],
    );
  }

  _donate() async {
    const url = 'https://www.buymeacoffee.com/bugCatcher';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class KitKatButton extends StatelessWidget {
  final kText;

  KitKatButton(this.kText);

  @override
  Widget build(BuildContext context) {
    const String shareUrl = 'shareURL';
    const String feedbackUrl =
        'mailto:arthurexcalibur9@protonmail.com?subject=Sigma%20Feedback&body=What%20are%20your%20thoughts?';
    const String licenseUrl = 'licenseURL';
    const String bugUrl = 'bugUrl';
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: AppColor.deepBlue,
        onTap: () {
          if (kText == 'FEEDBACK') {
            _externalLink(feedbackUrl);
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: 56.0,
          // color: Colors.red,
          child: Text(
            kText,
            textScaleFactor: 1.0,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
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
