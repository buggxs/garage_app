import 'package:flutter/material.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/common/widgets/labled_text.dart';
import 'package:garage_app/misc/color_constants.dart';

class GarageMetaPanel extends StatelessWidget {
  const GarageMetaPanel({
    Key? key,
    this.parkedCars = 0,
    this.brandList,
    this.carsWithWarnings,
  }) : super(key: key);

  final int? parkedCars;
  final String? brandList;
  final List<Car>? carsWithWarnings;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      width: double.infinity,
      color: Colors.amber,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4.0,
          ),
        ),
        color: ColorConstants.shieldBlue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabeledText(
                    caption: 'Fahrzeuge / Parkplätze',
                    text: '$parkedCars / 2',
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    captionStyle: Theme.of(context).textTheme.caption!.apply(
                          color: Colors.white,
                        ),
                  ),
                  LabeledText(
                    caption: 'Vorhandene Marken',
                    text: brandList ?? '-',
                    multiLineText: true,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    captionStyle: Theme.of(context).textTheme.caption!.apply(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              Row(
                children: [
                  LabeledText(
                    caption: 'Autos mit Warnungen',
                    text: _buildWarningsText() ?? '-',
                    multiLineText: true,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    captionStyle: Theme.of(context).textTheme.caption!.apply(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _buildWarningsText() {
    return carsWithWarnings
        ?.map((Car tmpCar) =>
            '${tmpCar.name} - ${tmpCar.technicalData?.brand} ${tmpCar.technicalData?.model}')
        .join('\n');
  }
}
