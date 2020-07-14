import 'package:flutter/material.dart';

import './screens/homepage.dart';
import './screens/new_note.dart';
import './screens/new_todo.dart';
import './screens/settings.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());

    case 'newNote':
      return MaterialPageRoute(builder: (context) => NewNote());

    case 'newTodo':
      return MaterialPageRoute(builder: (context) => NewTodo());
      
    case 'settings':
      return MaterialPageRoute(builder: (context) => SettingsScreen());

    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
