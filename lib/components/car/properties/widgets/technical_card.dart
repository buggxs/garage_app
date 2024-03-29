import 'package:flutter/material.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/common/widgets/labled_text.dart';
import 'package:garage_app/components/add_vehicle/I18n/add_vehicle_i18n.dart';
import 'package:garage_app/components/add_vehicle/I18n/add_vehicle_text.dart';
import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/components/car/i18n/car_text.dart';

class TechnicalCard extends StatelessWidget {
  const TechnicalCard({
    Key? key,
    required this.technicalData,
  }) : super(key: key);

  final TechnicalData? technicalData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 16,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: ImageIcon(
                      AssetImage('assets/icons/settings-gears.png'),
                      size: 22,
                    ),
                  ),
                  Text(
                    CarText.technicalCardHeading(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <LabeledText>[
                          LabeledText(
                            caption: CarText.type(),
                            text: '${technicalData?.type}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          LabeledText(
                            caption: AddVehicleText.purchasePrice(),
                            text: '${technicalData?.purchasePrice}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          LabeledText(
                            caption: AddVehicleText.vehicleTax(),
                            text: '${technicalData?.vehicleTax}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <LabeledText>[
                          LabeledText(
                            caption: CarText.hsn(),
                            text: '${technicalData?.hsn}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          LabeledText(
                            caption: CarText.tsn(),
                            text: '${technicalData?.tsn}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          LabeledText(
                            caption: CarText.fuelType(),
                            text: '${technicalData?.fuelTypeList}',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
