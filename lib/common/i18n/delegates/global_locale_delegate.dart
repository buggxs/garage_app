import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:garage_app/common/i18n/delegates/common_localizations_delegate.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:garage_app/misc/logger.dart';
import 'package:intl/intl.dart';

import 'i18n.dart';

class GlobalLocaleDelegate extends CommonLocalizationDelegate<void>
    with LoggerMixin {
  const GlobalLocaleDelegate();

  @override
  Future<void> load(Locale locale) async {
    log.info('set Intl locale to "$locale"');
    Intl.defaultLocale = locale.languageCode;

    log.info('set global locale to "$locale"');
    app<LocaleInformation>().currentLocale = locale;

    return SynchronousFuture<void>(null);
  }
}
