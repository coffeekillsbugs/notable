import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// import '../widgets/gradient_background.dart';
import '../widgets/sigma_button.dart';
import '../theme/colors.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
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
        // GradientBackground(),
        Scaffold(
          backgroundColor: AppColor.darkGrey,
          body: CustomScrollView(
            controller: _scrollController,
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
                    textScaleFactor: 0.9,
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
                            color: Colors.white.withOpacity(0.09),
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
                                'v1.0.0',
                                // textScaleFactor: 1.0,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                'A simple app.\nWrite notes, create todo\'s.',
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
                    KitKatButton('SHARE'),
                    KitKatButton('FEEDBACK'),
                    KitKatButton('LICENSES'),
                    KitKatButton('REPORT BUG'),
                    SizedBox(height: 26.0),
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
            ],
          ),
          floatingActionButton: SigmaButton(
            kHeroTag: 'about',
            kOnPressed: () {
              Navigator.pop(context);
            },
            kIcon: Icons.chevron_left_rounded,
            kSize: 40.0,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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

  void _scrollListener() {}
}

class KitKatButton extends StatelessWidget {
  final kText;

  KitKatButton(this.kText);

  @override
  Widget build(BuildContext context) {
    // const String shareUrl = 'shareURL';
    const String feedbackUrl = 'mailto:arthurexcalibur9@protonmail.com?subject=Sigma%20Feedback&body=What%20are%20your%20thoughts?';
    // const String licenseUrl = 'licenseURL';
    // const String bugUrl = 'bugUrl';
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
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
