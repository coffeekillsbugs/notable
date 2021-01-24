import 'package:flutter/material.dart';

import './screens/note_screen.dart';
import './screens/homepage.dart';
import './screens/about.dart';
import './screens/todo_screen.dart';
import 'views/note_view.dart';
import 'views/todo_view.dart';

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

    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
