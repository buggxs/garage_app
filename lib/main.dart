import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:garage_app/common/theme/custom_dark_theme.dart';
import 'package:garage_app/common/theme/custom_ligth_theme.dart';
import 'package:garage_app/components/garage/garage_screen.dart';
import 'package:garage_app/core/app_navigator/app_navigator.dart';
import 'package:garage_app/core/i18n/delegates/global_locale_delegate.dart';
import 'package:garage_app/core/i18n/delegates/mygarage_i18n_delegate.dart';
import 'package:logging/logging.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'core/app_service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Directions where the app can rotate
  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  // Configure logging
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord record) {
    // ignore: avoid_print
    print(
      '${record.time} - ${record.level.name} | '
      '${record.loggerName} => ${record.message}',
    );
  });

  // Register services
  setup();

  // Start the actual app
  runApp(MyGarage());
}

class MyGarage extends StatelessWidget {
  MyGarage({Key? key}) : super(key: key);

  final AppNavigator _appNavigator = AppNavigator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomLightTheme.lightTheme,
      darkTheme: CustomDarkTheme.darkTheme,
      home: const GarageScreen(),
      initialRoute: GarageScreen.route,
      onGenerateRoute: _appNavigator.generateRoute,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        // Own localizations implementation
        MyGarageI18nDelegate(),

        // localization for material widgets (e.g. tooltips, datetime picker)
        ...GlobalMaterialLocalizations.delegates,
        GlobalLocaleDelegate(),
        MonthYearPickerLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
        Locale('de', 'DE'),
      ],
    );
  }
}
