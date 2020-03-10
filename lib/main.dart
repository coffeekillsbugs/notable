import 'package:flutter/material.dart';
import 'package:notes/routes.dart' as router;

void main() => runApp(Notable());

class Notable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}
