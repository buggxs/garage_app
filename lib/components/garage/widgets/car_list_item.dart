import 'package:flutter/material.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/car/car_screen.dart';
import 'package:garage_app/components/common/widgets/icon_text.dart';
import 'package:garage_app/components/common/widgets/modal_service.dart';
import 'package:garage_app/components/garage/i18n/garage_i18n.dart';
import 'package:garage_app/components/garage/i18n/garage_text.dart';
import 'package:garage_app/components/garage/widgets/car_item_slidable.dart';
import 'package:garage_app/core/app_service_locator.dart';

typedef UpdateCarFunction = void Function({
  required Car car,
  String? lastChangeMileageString,
  String? lastChangeDateString,
});

class CarListItem extends StatelessWidget {
  const CarListItem({
    Key? key,
    required this.car,
    required this.onUpdate,
    this.index,
    this.onLongPress,
    this.onDelete,
  }) : super(key: key);

  final Car car;
  final UpdateCarFunction onUpdate;
  final int? index;
  final Function? onLongPress;
  final void Function(Car car)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.grey[400],
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () => Navigator.of(context).pushNamed(
                CarScreen.route,
                arguments: car,
              ),
              onLongPress: () => app<ModalService>().showUpdateModal(
                context: context,
                car: car,
                onUpdate: onUpdate,
              ),
              child: CarItemSlidable(
                onDelete: () => onDelete?.call(car),
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
        ),
      ],
    );
  }

  Widget _carImage() {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(0)),
        child: SizedBox(
          height: 100,
          width: 100,
          child: (car.imageUrls?.isNotEmpty ?? false)
              ? FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  placeholder: 'assets/img/car-placeholder.png',
                  image: car.imageUrls!.first,
                )
              : const Image(
                  image: AssetImage('assets/img/car-placeholder.png'),
                ),
        ),
      ),
    );
  }

  Widget _carHeading(Car car) {
    return Builder(builder: (context) {
      return Container(
        child: Text(
          '${car.name} - ${car.technicalData?.brand} ${car.technicalData?.model}',
          style: Theme.of(context).textTheme.headline2,
        ),
        padding: const EdgeInsets.all(8.0),
      );
    });
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
                text: GarageText.airConditioner(),
                iconData: Icons.ac_unit,
                iconColor: Colors.green[800],
                size: 20.0,
              ),
              const SizedBox(
                height: 5,
              ),
              IconText(
                text: GarageText.oil(),
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
                text: GarageText.brake(),
                assetImage: const AssetImage("assets/icons/brake.png"),
                iconColor: Colors.green[800],
                size: 20.0,
              ),
              const SizedBox(
                height: 5,
              ),
              IconText(
                text: GarageText.timingBelt(),
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
