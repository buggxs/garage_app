import 'package:garage_app/common/i18n/common_i18n.dart';
import 'package:garage_app/core/i18n/delegates/mygarage_i18n.dart';

extension CommonTextExtension on CommonText {
  String call({List<String>? args}) {
    return MyGarageI18n.commonI18n?.get(this, args) ?? '';
  }
}
