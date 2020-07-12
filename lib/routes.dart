import 'package:flutter/material.dart';
import 'package:notes/screens/homepage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {

  switch (settings.name) {
    case '/': return MaterialPageRoute(builder: (context) => HomePage());
      //break;

    //case 'addNote': return MaterialPageRoute(builder: (context) => NewNote());
      //break;
    default: return MaterialPageRoute(builder: (context) => HomePage());
  }
}