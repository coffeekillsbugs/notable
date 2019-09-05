import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'custom_colors.dart';

void main() => runApp(Notable());

class Notable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: smokyBlack,
        accentColor: carribeanGreen,
        scaffoldBackgroundColor: smokyBlack,
      ),
      home: LandingPage(),
    );
  }
}