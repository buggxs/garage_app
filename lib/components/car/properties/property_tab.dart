import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/car/properties/bloc/car_property_cubit.dart';
import 'package:garage_app/components/car/properties/details/property_details_screen.dart';
import 'package:garage_app/components/car/properties/widget/property_card.dart';
import 'package:garage_app/components/car/properties/widget/technical_card.dart';
import 'package:garage_app/components/common/widgets/labled_text.dart';
import 'package:garage_app/components/common/widgets/modal_service.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:garage_app/core/utils/number_formatter.dart';
import 'package:garage_app/core/utils/text_formatter.dart';

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
    return BlocProvider(
      create: (BuildContext context) => CarPropertyCubit(
        car: car,
      ),
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
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                items: imageList.map((imageUrl) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Image(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.fitHeight,
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  infoCard(context, "TÜV bis: ",
                      TextFormatter.formatDateToMonthAndYear(_car.date)),
                  infoCard(context, "Kilometerstand: ",
                      NumberFormatter.mileageFormatter(_car.mileage)),
                  infoCard(context, "Baujahr: ", _car.vintage.toString()),
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

  Widget infoCard(BuildContext context, String caption, String content) {
    return Card(
      color: Colors.white,
      child: LabeledText(
        caption: caption,
        text: content,
      ),
    );
  }
}
