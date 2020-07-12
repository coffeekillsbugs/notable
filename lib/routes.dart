import 'package:flutter/material.dart';
import 'package:notes/screens/homepage.dart';
import 'package:notes/screens/new_note.dart';
import 'package:notes/screens/new_todo.dart';
import 'package:notes/screens/settings.dart';

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
