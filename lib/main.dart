import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './routes.dart' as router;
import './theme/colors.dart';
import './theme/textTheme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(Sigma());
}

class Sigma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ThemeData sigmaTheme = ThemeData.light();

    return MaterialApp(
      title: 'Sigma',
      theme: sigmaTheme.copyWith(
        primaryColor: AppColor.deepBlue,
        textTheme: sigmaTextTheme,
      ),
        onGenerateRoute: router.generateRoute,
        initialRoute: '/',
      );
  }
}
