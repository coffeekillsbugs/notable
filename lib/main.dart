import 'package:flutter/material.dart';
import 'package:notes/Screens/landing_screen.dart';

void main() => runApp(Notable());

class Notable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    home: LandingPage());
  }
}
