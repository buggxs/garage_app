import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyCard extends StatelessWidget {

  PropertyCard({
    Key? key,
    required this.property,
    this.type = 'danger'
  }) : super(key: key);

  final String? type;
  final String property;

  final Map<String, Map<String, dynamic>> colorType = {
    'success': {
      'heading': Colors.greenAccent.shade700,
      'divider': Colors.greenAccent.shade200,
      'body': LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Colors.greenAccent.shade200, Colors.greenAccent.shade400]
      ),
    },
    'warning': {
      'heading': Colors.yellowAccent.shade700,
      'divider': Colors.yellowAccent.shade200,
      'body': LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Colors.yellowAccent.shade200, Colors.yellowAccent.shade400]
      ),
    },
    'danger': {
      'heading': Colors.redAccent.shade700,
      'divider': Colors.redAccent.shade200,
      'body': LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Colors.redAccent.shade200, Colors.redAccent.shade400]
      ),
    },
  };

  @override
  Widget build(BuildContext context) {

    final Map<String, Map<String, dynamic>> content = {
      'oil': {
        'card_heading': AppLocalizations.of(context)!.oil_card_heading,
        'card_icon': const ImageIcon(AssetImage("assets/icons/car-oil.png"), size: 20.0,),
        'last_change_text': AppLocalizations.of(context)!.last_change,
        'next_change_text': AppLocalizations.of(context)!.next_change,
      },
      'air_conditioner': {
        'card_heading': AppLocalizations.of(context)!.air_conditioner_card_heading,
        'card_icon': const Icon(Icons.ac_unit, size: 20.0,),
        'last_change_text': AppLocalizations.of(context)!.last_change,
        'next_change_text': AppLocalizations.of(context)!.next_change,
      },
      'brake': {
        'card_heading': AppLocalizations.of(context)!.brake_card_heading,
        'card_icon': const ImageIcon(AssetImage("assets/icons/brake.png"), size: 20.0,),
        'last_change_text': AppLocalizations.of(context)!.last_change,
        'next_change_text': AppLocalizations.of(context)!.next_change,
      },
      'timing_belt': {
        'card_heading': AppLocalizations.of(context)!.timing_belt_card_heading,
        'card_icon': const ImageIcon(AssetImage("assets/icons/timing-belt.png"), size: 20.0,),
        'last_change_text': AppLocalizations.of(context)!.last_change,
        'next_change_text': AppLocalizations.of(context)!.next_change,
      }
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      child: InkWell(
        onTap: () => showUpdateModal(context, content),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(4.0),
                      topLeft: Radius.circular(4.0),
                    ),
                    color: colorType[type]!['heading']
                ),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: content[property]!['card_icon'],
                    ),
                    Text(
                      content[property]!['card_heading'],
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: colorType[type]!['divider'],
                child: const SizedBox(
                  height: 3,
                  width: double.infinity,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: colorType[type]!['body']
                ),
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content[property]!['last_change_text'],
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("100.00 km /"),
                        const Text("08.12.2021"),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void showUpdateModal(
      BuildContext context,
      Map<String, Map<String, dynamic>> content
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              gradient: colorType[type]!['body']
          ),
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: content[property]!['card_icon'],
                        ),
                        Text(
                          content[property]!['card_heading'],
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        onPressed: () =>
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => _buildPopupDialog(context),
                            ),
                        child: Text("PopUp")
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Popup example'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

}
