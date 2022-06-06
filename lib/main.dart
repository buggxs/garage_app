import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:garage_app/common/i18n/delegates/mygarage_i18n_delegate.dart';
import 'package:garage_app/components/common/widgets/custom_ligth_theme.dart';
import 'package:garage_app/components/garage/garage_screen.dart';
import 'package:garage_app/core/app_navigator/app_navigator.dart';
import 'package:logging/logging.dart';

import 'common/i18n/delegates/global_locale_delegate.dart';
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
      theme: CustomLightTheme.lightTheme,
      home: const GarageScreen(),
      initialRoute: GarageScreen.route,
      onGenerateRoute: AppNavigator.generateRoute,
      localizationsDelegates: const [
        MyGarageI18nDelegate(),

        // localization for material widgets (e.g. tooltips,
        // datetime picker)
        ...GlobalMaterialLocalizations.delegates,
        GlobalLocaleDelegate(),
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
      ],
    );
  }
}
