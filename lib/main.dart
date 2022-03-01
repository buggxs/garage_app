import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:garage_app/components/authentication/auth_repository.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:garage_app/components/authentication/session/session_navigator.dart';
import 'package:logging/logging.dart';

import 'core/app_service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.time} - ${record.level.name} | '
        '${record.loggerName} => ${record.message}');
  });

  setup();
  runApp(const MyGarage());
}

class MyGarage extends StatelessWidget {
  const MyGarage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.amber[800], backgroundColor: Colors.white),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) => SessionCubit(
            authRepository: context.read<AuthRepository>(),
          ),
          child: const SessionNavigator(),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('de', ''),
        Locale('en', ''),
      ],
    );
  }
}
