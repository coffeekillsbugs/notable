import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './routes.dart' as router;
import './providers/flag_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(Notable());
}

class Notable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlagProvider(),
          child: MaterialApp(
        onGenerateRoute: router.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
