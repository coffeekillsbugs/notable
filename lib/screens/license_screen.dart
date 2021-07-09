import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:sigma/widgets/sigma_button.dart';
import 'package:sigma/models/license_model.dart';
import 'package:sigma/theme/colors.dart';

class LicenseScreen extends StatefulWidget {
  @override
  _LicenseScreenState createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {

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
                'Licenses',
                style: Theme.of(context).textTheme.headline4,
              ),
              titlePadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              // background: Container(color: AppColor.darkGrey),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: ExpansionTile(
                      title: Text(
                        dependencyLicenses[index].licenseName,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        dependencyLicenses[index].licenseVersion,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      backgroundColor: AppColor.overlaySeven,
                      collapsedBackgroundColor: AppColor.overlaySeven,
                      // collapsedTextColor: AppColor.mintCream,
                      // collapsedIconColor: AppColor.mintCream,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding: EdgeInsets.all(8.0),
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            dependencyLicenses[index].licenseContents,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14.0,
                              // color: AppColor.mintCream,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: dependencyLicenses.length,
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
}