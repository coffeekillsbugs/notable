import 'package:flutter/material.dart';

import './screens/homepage.dart';
import './screens/info.dart';
import './screens/new_note.dart';
import './screens/new_todo.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());

    case 'NewNote':
      return MaterialPageRoute(builder: (context) => NewNoteScreen());

    case 'NewTodo':
      return MaterialPageRoute(builder: (context) => NewTodoScreen());
      
    case 'Info':
      return MaterialPageRoute(builder: (context) => InfoScreen());

    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
