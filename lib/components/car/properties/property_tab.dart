import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
import 'package:garage_app/components/car/properties/cubit/car_property_cubit.dart';
import 'package:garage_app/components/car/properties/details/property_details_screen.dart';
import 'package:garage_app/components/car/properties/widgets/property_card.dart';
import 'package:garage_app/components/car/properties/widgets/technical_card.dart';
import 'package:garage_app/components/common/widgets/labled_text.dart';
import 'package:garage_app/components/common/widgets/modal_service.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:garage_app/misc/number_formatter.dart';
import 'package:garage_app/misc/text_formatter.dart';

enum CarProperty {
  oil,
  airConditioner,
  brake,
  timingBelt,
}

class PropertyTab extends StatelessWidget {
  const PropertyTab({required this.car, Key? key}) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    CarCubit cubit = CarCubit.of(context);

    return BlocProvider.value(
      value: cubit.carPropertyCubit,
      child: const PropertyTabContent(),
    );
  }
}

class PropertyTabContent extends StatelessWidget {
  const PropertyTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'assets/img/bmw.jpg',
      'assets/img/bmw2.jpeg',
      'assets/img/bmw3.jpg',
    ];

    CarPropertyCubit cubit = context.watch<CarPropertyCubit>();
    Car _car = cubit.state.car;

    return SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0),
              items: imageList.map((imageUrl) {
                return Image(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  infoCard(
                    context,
                    "TÜV bis: ",
                    TextFormatter.formatDateToMonthAndYear(_car.date),
                  ),
                  infoCard(
                    context,
                    "Kilometerstand: ",
                    NumberFormatter.mileageFormatter(_car.mileage),
                  ),
                  infoCard(
                    context,
                    "Baujahr: ",
                    _car.vintage.toString(),
                  ),
                ],
              ),
            ),
            PropertyCard(
              _car.oilData,
              type: _car.calculateCarType(_car.oilData),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PropertyDetailsScreen(),
                ),
              ),
              onLongPress: () => app<ModalService>().showPropertyUpdateModal(
                context: context,
                type: _car.calculateCarType(_car.oilData),
                data: _car.oilData,
                onUpdate: cubit.updateCarProperty,
              ),
            ),
            PropertyCard(
              _car.airConditioner,
              type: _car.calculateCarType(_car.airConditioner),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PropertyDetailsScreen(),
                ),
              ),
              onLongPress: () => app<ModalService>().showPropertyUpdateModal(
                context: context,
                type: _car.calculateCarType(_car.airConditioner),
                data: _car.airConditioner,
                onUpdate: cubit.updateCarProperty,
              ),
            ),
            PropertyCard(
              _car.brakeData,
              type: _car.calculateCarType(_car.brakeData),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PropertyDetailsScreen(),
                ),
              ),
              onLongPress: () => app<ModalService>().showPropertyUpdateModal(
                context: context,
                type: _car.calculateCarType(_car.brakeData),
                data: _car.brakeData,
                onUpdate: cubit.updateCarProperty,
              ),
            ),
            PropertyCard(
              _car.timingBeltData,
              type: _car.calculateCarType(_car.timingBeltData),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PropertyDetailsScreen(),
                ),
              ),
              onLongPress: () => app<ModalService>().showPropertyUpdateModal(
                context: context,
                type: _car.calculateCarType(_car.timingBeltData),
                data: _car.timingBeltData,
                onUpdate: cubit.updateCarProperty,
              ),
            ),
            TechnicalCard(
              technicalData: _car.technicalData,
            ),
          ],
        ));
  }

  Widget divider() {
    return Expanded(
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: Container(
              height: 10,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget infoCard(BuildContext context, String caption, String content) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: Color.fromRGBO(0, 91, 140, 1.0),
      child: LabeledText(
        caption: caption,
        text: content,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        captionStyle: Theme.of(context).textTheme.caption!.apply(
              color: Colors.white,
            ),
      ),
    );
  }
}
