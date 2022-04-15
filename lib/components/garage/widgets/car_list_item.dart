import 'package:flutter/material.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/car/car_screen.dart';
import 'package:garage_app/components/common/widgets/icon_text.dart';
import 'package:garage_app/components/common/widgets/modal_service.dart';
import 'package:garage_app/components/garage/bloc/garage_bloc.dart';
import 'package:garage_app/core/app_localizations.dart';
import 'package:garage_app/core/app_service_locator.dart';

import 'garage_slot_middle_divider.dart';

class CarListItem extends StatelessWidget {
  const CarListItem({
    Key? key,
    required this.car,
    this.index,
    this.onLongPress,
  }) : super(key: key);

  final Function? onLongPress;
  final int? index;
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
          child: Card(
            color: Colors.grey[400],
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () => Navigator.of(context).pushNamed(
                CarScreen.route,
                arguments: car,
              ),
              onLongPress: () => app<ModalService>().showUpdateModal(
                context: context,
                onUpdate: ({
                  dynamic carProperty,
                  String? lastChangeMileageString,
                  String? lastChangeDateString,
                }) =>
                    GarageBloc.of(context).add(GarageUpdateCarEvent(
                  car: car,
                  lastChangeMileageString: lastChangeMileageString,
                  lastChangeDateString: lastChangeDateString,
                )),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _carImage(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _carHeading(car),
                        _carProperties(context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const GarageSlotMiddleDivider(),
      ],
    );
  }

  Widget _carImage() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: const ClipRRect(
        child: SizedBox(
          height: 100,
          width: 100,
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/img/car-placeholder.png'),
            image: AssetImage('assets/img/bmw.jpg'),
          ),
        ),
      ),
    );
  }

  Widget _carHeading(Car car) {
    return Container(
      child: Text(
        '${car.name} - ${car.technicalData?.brand} ${car.technicalData?.model}',
        style: const TextStyle(fontSize: 18),
      ),
      padding: const EdgeInsets.all(8.0),
    );
  }

  Widget _carProperties(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconText(
                text:
                    AppLocalizations.of(context)!.translate('air_conditioner')!,
                iconData: Icons.ac_unit,
                iconColor: Colors.green[800],
                size: 20.0,
              ),
              const SizedBox(
                height: 5,
              ),
              IconText(
                text: AppLocalizations.of(context)!.translate('oil')!,
                assetImage: const AssetImage("assets/icons/car-oil.png"),
                iconColor: Colors.green[800],
                size: 20.0,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconText(
                text: AppLocalizations.of(context)!.translate('brake')!,
                assetImage: const AssetImage("assets/icons/brake.png"),
                iconColor: Colors.green[800],
                size: 20.0,
              ),
              const SizedBox(
                height: 5,
              ),
              IconText(
                text: AppLocalizations.of(context)!.translate('timing_belt')!,
                assetImage: const AssetImage("assets/icons/timing-belt.png"),
                iconColor: Colors.green[800],
                size: 20.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
