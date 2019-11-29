import 'package:flutter/material.dart';
import 'package:notes/Constants/Colors.dart';
import 'package:notes/Screens/landingScreen.dart';

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