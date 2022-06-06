import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:garage_app/common/i18n/delegates/common_localizations_delegate.dart';

import 'mygarage_i18n.dart';

/// Used by the [MaterialApp.localizationsDelegates] to load the [MyGarageI18n]
/// instance.
class MyGarageI18nDelegate extends CommonLocalizationDelegate<MyGarageI18n> {
  const MyGarageI18nDelegate();

  @override
  Future<MyGarageI18n> load(Locale locale) {
    return SynchronousFuture<MyGarageI18n>(MyGarageI18n(locale.languageCode));
  }
}
