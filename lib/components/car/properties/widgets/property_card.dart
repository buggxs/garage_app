import 'package:flutter/material.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/components/car/properties/util/card_content.dart';
import 'package:garage_app/components/common/widgets/labled_text.dart';
import 'package:garage_app/core/utils/number_formatter.dart';
import 'package:garage_app/core/utils/text_formatter.dart';

class PropertyCard extends StatelessWidget {
  PropertyCard(
    this.data, {
    Key? key,
    this.type = 'danger',
    this.property = CarProperty.oil,
    this.onTap,
    this.onLongPress,
  }) : super(key: key) {
    property = Car.getCarProperty(data);
  }

  final String? type;
  CarProperty? property;
  final dynamic data;
  Function? onTap;
  Function? onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 16.0,
      ),
      child: InkWell(
        onTap: () => onTap!(),
        onLongPress: () => onLongPress!(),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeadline(context),
              _buildDivider(),
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(4.0),
          topLeft: Radius.circular(4.0),
        ),
        color: getCardColor(type!)!['heading'],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: getCardContent(context, property!)!['card_icon'],
          ),
          Text(
            getCardContent(context, property!)!['card_heading'],
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      color: getCardColor(type!)!['divider'],
      child: const SizedBox(
        height: 3,
        width: double.infinity,
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: getCardColor(type!)!['body'],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabeledText(
                  caption:
                      getCardContent(context, property!)!['last_change_text'],
                  text:
                      NumberFormatter.mileageFormatter(data.lastChangeMileage) +
                          " km / " +
                          TextFormatter.formatGermanDate(data.lastChangeDate),
                  multiLineText: true,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabeledText(
                  caption:
                      getCardContent(context, property!)!['next_change_text'],
                  text:
                      NumberFormatter.mileageFormatter(data.nextChangeMileage) +
                          " km oder " +
                          TextFormatter.formatGermanDate(data.nextChangeDate),
                  multiLineText: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
