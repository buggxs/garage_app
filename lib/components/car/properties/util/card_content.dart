import 'package:flutter/material.dart';
import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/components/car/i18n/car_text.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';

Map<String, dynamic>? getCardContent(
  BuildContext context,
  CarProperty carProperty,
) {
  final Map<CarProperty, Map<String, dynamic>> content =
      <CarProperty, Map<String, dynamic>>{
    CarProperty.oil: <String, dynamic>{
      'card_heading': CarText.oilCardHeading(),
      'card_icon': const ImageIcon(
        AssetImage('assets/icons/car-oil.png'),
        size: 28,
      ),
      'last_change_text': CarText.lastChange(),
      'next_change_text': CarText.nextChange(),
    },
    CarProperty.airConditioner: <String, dynamic>{
      'card_heading': CarText.airConditionerCardHeading(),
      'card_icon': const Icon(
        Icons.ac_unit,
        size: 24,
      ),
      'last_change_text': CarText.lastChange(),
      'next_change_text': CarText.nextChange(),
    },
    CarProperty.brake: <String, dynamic>{
      'card_heading': CarText.brakeCardHeading(),
      'card_icon': const ImageIcon(
        AssetImage('assets/icons/brake.png'),
        size: 24,
      ),
      'last_change_text': CarText.lastChange(),
      'next_change_text': CarText.nextChange(),
    },
    CarProperty.timingBelt: <String, dynamic>{
      'card_heading': CarText.timingBeltCardHeading(),
      'card_icon': const ImageIcon(
        AssetImage('assets/icons/timing-belt.png'),
        size: 24,
      ),
      'last_change_text': CarText.lastChange(),
      'next_change_text': CarText.nextChange(),
    }
  };
  return content[carProperty];
}

Map<String, dynamic>? getCardColor(String type) {
  final Map<String, Map<String, dynamic>> colorType =
      <String, Map<String, dynamic>>{
    'success': <String, dynamic>{
      'heading': Colors.greenAccent.shade700,
      'divider': Colors.greenAccent.shade200,
      'body': LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: <Color>[
          Colors.greenAccent.shade200,
          Colors.greenAccent.shade400,
        ],
      ),
    },
    'warning': <String, dynamic>{
      'heading': Colors.yellowAccent.shade700,
      'divider': Colors.yellowAccent.shade200,
      'body': LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: <Color>[
          Colors.yellowAccent.shade200,
          Colors.yellowAccent.shade400,
        ],
      ),
    },
    'danger': <String, dynamic>{
      'heading': Colors.redAccent.shade700,
      'divider': Colors.redAccent.shade200,
      'body': LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: <Color>[
          Colors.redAccent.shade200,
          Colors.redAccent.shade400,
        ],
      ),
    },
  };
  return colorType[type];
}
