import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/common/service/app_service.dart';
import 'package:garage_app/common/service/modal_service.dart';
import 'package:garage_app/common/widgets/labled_text.dart';
import 'package:garage_app/components/car/model/air_conditioner_data.dart';
import 'package:garage_app/components/car/model/brake_data.dart';
import 'package:garage_app/components/car/model/oil_data.dart';
import 'package:garage_app/components/car/model/timing_belt_data.dart';

class PropertyCard extends StatelessWidget {
  PropertyCard(
    this.data, {
    Key? key,
    this.type = 'danger',
    this.property = 'oil',
  }) : super(key: key) {
    if (data is OilData) {
      property = 'oil';
    } else if (data is AirConditionerData) {
      property = 'air_conditioner';
    } else if (data is BrakeData) {
      property = 'brake';
    } else if (data is TimingBeltData) {
      property = 'timing_belt';
    }
  }

  final String? type;
  String? property;
  final dynamic data;

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

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, dynamic>> content = {
      'oil': {
        'card_heading': AppLocalizations.of(context)!.oil_card_heading,
        'card_icon': const ImageIcon(
          AssetImage("assets/icons/car-oil.png"),
          size: 24.0,
        ),
        'last_change_text': AppLocalizations.of(context)!.last_change,
        'next_change_text': AppLocalizations.of(context)!.next_change,
      },
      'air_conditioner': {
        'card_heading':
            AppLocalizations.of(context)!.air_conditioner_card_heading,
        'card_icon': const Icon(
          Icons.ac_unit,
          size: 24.0,
        ),
        'last_change_text': AppLocalizations.of(context)!.last_change,
        'next_change_text': AppLocalizations.of(context)!.next_change,
      },
      'brake': {
        'card_heading': AppLocalizations.of(context)!.brake_card_heading,
        'card_icon': const ImageIcon(
          AssetImage("assets/icons/brake.png"),
          size: 24.0,
        ),
        'last_change_text': AppLocalizations.of(context)!.last_change,
        'next_change_text': AppLocalizations.of(context)!.next_change,
      },
      'timing_belt': {
        'card_heading': AppLocalizations.of(context)!.timing_belt_card_heading,
        'card_icon': const ImageIcon(
          AssetImage("assets/icons/timing-belt.png"),
          size: 24.0,
        ),
        'last_change_text': AppLocalizations.of(context)!.last_change,
        'next_change_text': AppLocalizations.of(context)!.next_change,
      }
    };

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 16.0,
      ),
      child: InkWell(
        onTap: () => app<ModalService>().showPropertyUpdateModal(
          context,
          content,
          colorType,
          type!,
          property!,
        ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeadline(context, content),
              _buildDivider(),
              _buildBody(context, content),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline(
    BuildContext context,
    Map<String, Map<String, dynamic>> content,
  ) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(4.0),
          topLeft: Radius.circular(4.0),
        ),
        color: colorType[type]!['heading'],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: content[property]!['card_icon'],
          ),
          Text(
            content[property]!['card_heading'],
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      color: colorType[type]!['divider'],
      child: const SizedBox(
        height: 3,
        width: double.infinity,
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    Map<String, Map<String, dynamic>> content,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: colorType[type]!['body'],
      ),
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledText(
                caption: content[property]!['last_change_text'],
                text: "100.00 km /",
                multiLineText: "08.12.2021",
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content[property]!['next_change_text'],
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("160.000 km oder"),
              const Text("08.12.2022"),
            ],
          )
        ],
      ),
    );
  }
}
