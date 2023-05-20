import 'package:flutter/material.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/common/widgets/icon_text.dart';
import 'package:garage_app/common/widgets/image_placeholder.dart';
import 'package:garage_app/common/widgets/modal_service.dart';
import 'package:garage_app/components/car/car_screen.dart';
import 'package:garage_app/components/car/properties/util/card_content.dart';
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
    this.onWillPop,
  }) : super(key: key);

  final Car car;
  final UpdateCarFunction onUpdate;
  final int? index;
  final Function? onLongPress;
  final void Function(Car car)? onDelete;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.grey[400],
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () => Navigator.of(context).pushNamed(
                CarScreen.route,
                arguments: <String, dynamic>{
                  'car': car,
                  'onWillPop': onWillPop,
                },
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
                  children: <Widget>[
                    _carImage(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
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
    String? imageUrl;
    if (car.imageUrls.isNotEmpty) {
      imageUrl = car.imageUrls.first;
    }
    return Container(
      padding: const EdgeInsets.all(1),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(0),
        ),
        child: SizedBox(
          height: 100,
          width: 100,
          child: ImagePlaceholder(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }

  Widget _carHeading(Car car) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            '${car.name} ${(car.brand != null) || (car.model != null) ? '-' : ''}'
            '${car.brand ?? ''} ${car.model ?? ''}',
            style: Theme.of(context).textTheme.headline2,
          ),
        );
      },
    );
  }

  Widget _carProperties(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconText(
                text: GarageText.airConditioner(),
                iconData: Icons.ac_unit,
                iconColor: getCardColor(
                  car.calculateCarType(car.airConditioner),
                )?['heading'],
                size: 20,
              ),
              const SizedBox(
                height: 5,
              ),
              IconText(
                text: GarageText.oil(),
                assetImage: const AssetImage('assets/icons/car-oil.png'),
                iconColor: getCardColor(
                  car.calculateCarType(car.oilData),
                )?['heading'],
                size: 20,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconText(
                text: GarageText.brake(),
                assetImage: const AssetImage('assets/icons/brake.png'),
                iconColor: getCardColor(
                  car.calculateCarType(car.brakeData),
                )?['heading'],
                size: 20,
              ),
              const SizedBox(
                height: 5,
              ),
              IconText(
                text: GarageText.timingBelt(),
                assetImage: const AssetImage('assets/icons/timing-belt.png'),
                iconColor: getCardColor(
                  car.calculateCarType(car.timingBeltData),
                )?['heading'],
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
