import 'dart:ui';

import 'package:logging/logging.dart';

abstract class I18n<T> {
  const I18n({
    required this.languageCode,
    this.values,
  });

  final String languageCode;

  final Map<String, Map<T, String>>? values;

  static final Logger logger = Logger('I18n');

  String get(T key, [List<String>? args]) {
    if (values?[languageCode] == null) {
      logger.warning('unsupported locale: $languageCode');
      return '';
    }

    final String? text = values?[languageCode]?[key];

    if (text == null) {
      logger.warning('no $languageCode text for given key: $key');
      return '';
    }

    if (args == null) {
      return text;
    } else {
      // parse placeholders
      String value = text;

      for (int i = 0; i < args.length; i++) {
        value = value.replaceAll('{$i}', args[i]);
      }

      return value;
    }
  }
}

class LocaleInformation {
  Locale? currentLocale;
}
