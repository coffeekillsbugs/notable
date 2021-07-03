import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sigma/theme/theme_data.dart';

import 'services/routes.dart' as router;
import 'services/sigma_provider.dart';
import './models/sigma_note.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  // >>> Hive Adapters
  Hive.registerAdapter(SigmaNoteAdapter());
  Hive.registerAdapter(TodoItemModelAdapter());
  Hive.registerAdapter(NoteTypeAdapter());

  // >>> Hive Box
  await Hive.initFlutter();
  await Hive.openBox<SigmaNote>('sigmaNotes');

  runApp(Sigma());
}

class Sigma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ChangeNotifierProvider(
      create: (context) => SigmaProvider(),
      child: MaterialApp(
        title: 'Sigma',
        theme: sigmaTheme,
        onGenerateRoute: router.generateRoute,
        initialRoute: '/',
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData data = MediaQuery.of(context);

          return MediaQuery(
            data: data.copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
