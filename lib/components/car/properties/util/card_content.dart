import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';

Map<String, dynamic>? getCardContent(
    BuildContext context, CarProperty carProperty) {
  final Map<CarProperty, Map<String, dynamic>> content = {
    CarProperty.oil: {
      'card_heading': AppLocalizations.of(context)!.oil_card_heading,
      'card_icon': const ImageIcon(
        AssetImage("assets/icons/car-oil.png"),
        size: 24.0,
      ),
      'last_change_text': AppLocalizations.of(context)!.last_change,
      'next_change_text': AppLocalizations.of(context)!.next_change,
    },
    CarProperty.airConditioner: {
      'card_heading':
          AppLocalizations.of(context)!.air_conditioner_card_heading,
      'card_icon': const Icon(
        Icons.ac_unit,
        size: 24.0,
      ),
      'last_change_text': AppLocalizations.of(context)!.last_change,
      'next_change_text': AppLocalizations.of(context)!.next_change,
    },
    CarProperty.brake: {
      'card_heading': AppLocalizations.of(context)!.brake_card_heading,
      'card_icon': const ImageIcon(
        AssetImage("assets/icons/brake.png"),
        size: 24.0,
      ),
      'last_change_text': AppLocalizations.of(context)!.last_change,
      'next_change_text': AppLocalizations.of(context)!.next_change,
    },
    CarProperty.timingBelt: {
      'card_heading': AppLocalizations.of(context)!.timing_belt_card_heading,
      'card_icon': const ImageIcon(
        AssetImage("assets/icons/timing-belt.png"),
        size: 24.0,
      ),
      'last_change_text': AppLocalizations.of(context)!.last_change,
      'next_change_text': AppLocalizations.of(context)!.next_change,
    }
  };
  return content[carProperty];
}

Map<String, dynamic>? getCardColor(String type) {
  final Map<String, Map<String, dynamic>> colorType = {
    'success': {
      'heading': Colors.greenAccent.shade700,
      'divider': Colors.greenAccent.shade200,
      'body': LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Colors.greenAccent.shade200, Colors.greenAccent.shade400]),
    },
    'warning': {
      'heading': Colors.yellowAccent.shade700,
      'divider': Colors.yellowAccent.shade200,
      'body': LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Colors.yellowAccent.shade200, Colors.yellowAccent.shade400]),
    },
    'danger': {
      'heading': Colors.redAccent.shade700,
      'divider': Colors.redAccent.shade200,
      'body': LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Colors.redAccent.shade200, Colors.redAccent.shade400]),
    },
  };
  return colorType[type];
}
