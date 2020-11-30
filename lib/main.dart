import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './routes.dart' as router;
import './theme/colors.dart';
import './theme/textTheme.dart';
import 'sigma_provider.dart';

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

    return ChangeNotifierProvider(
      create: (context) => SigmaProvider(),
          child: MaterialApp(
        title: 'Sigma',
        builder: (BuildContext context, Widget child) {
          final MediaQueryData data = MediaQuery.of(context);

          return MediaQuery(
            data: data.copyWith(
              textScaleFactor: 1.0,
            ),
            child: child,
          );
        },
        theme: sigmaTheme.copyWith(
          primaryColor: AppColor.darkGrey,
          
          textTheme: sigmaTextTheme,
        ),
        onGenerateRoute: router.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
