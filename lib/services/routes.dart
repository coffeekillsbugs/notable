import 'package:flutter/material.dart';

import 'package:sigma/screens/note_screen.dart';
import 'package:sigma/screens/home_screen.dart';
import 'package:sigma/screens/about.dart';
import 'package:sigma/screens/todo_screen.dart';
import 'package:sigma/views/note_view.dart';
import 'package:sigma/views/todo_view.dart';
import 'package:sigma/screens/license_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());

    case 'NoteScreen':
      return MaterialPageRoute(builder: (context) => NoteScreen());

    case 'TodoScreen':
      return MaterialPageRoute(builder: (context) => TodoScreen());

    case 'About':
      return MaterialPageRoute(builder: (context) => AboutScreen());

    case 'NoteView':
      return MaterialPageRoute(builder: (context) => NoteView());

    case 'TodoView':
      return MaterialPageRoute(builder: (context) => TodoView());

    case 'license':
      return MaterialPageRoute(builder: (context) => LicenseScreen());

    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
