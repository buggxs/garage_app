import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
import 'package:garage_app/components/car/properties/cubit/property_cubit.dart';
import 'package:garage_app/components/car/properties/details/property_details_screen.dart';
import 'package:garage_app/components/car/properties/widgets/image_slider.dart';
import 'package:garage_app/components/car/properties/widgets/info_card.dart';
import 'package:garage_app/components/car/properties/widgets/property_card.dart';
import 'package:garage_app/components/car/properties/widgets/technical_card.dart';
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
  const PropertyTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarCubit carCubit = context.watch<CarCubit>();

    return BlocProvider(
      create: (context) => PropertyCubit(
        car: carCubit.car,
        carCubit: carCubit,
      )..loadProperties(),
      child: const PropertyTabContent(),
    );
  }
}

class PropertyTabContent extends StatelessWidget {
  const PropertyTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PropertyCubit cubit = context.watch<PropertyCubit>();
    CarPropertiesState state = cubit.state;

    Widget child = const Center(
      child: CircularProgressIndicator(),
    );

    Car _car = state.car;

    child = SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlider(
            urlList: _car.imageUrls,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCard(
                  caption: "TÜV bis: ",
                  content: TextFormatter.formatDateToMonthAndYear(_car.date),
                ),
                InfoCard(
                  caption: "Kilometerstand: ",
                  content: NumberFormatter.mileageFormatter(_car.mileage),
                ),
                InfoCard(
                  caption: "Baujahr: ",
                  content: _car.vintage.toString(),
                ),
              ],
            ),
          ),
          PropertyCard(
            _car.oilData ?? const OilData(),
            type: _car.calculateCarType(_car.oilData),
            property: Car.getCarProperty(_car.oilData),
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
            _car.airConditioner ?? const AirConditionerData(),
            type: _car.calculateCarType(_car.airConditioner),
            property: Car.getCarProperty(_car.airConditioner),
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
            _car.brakeData ?? const BrakeData(),
            type: _car.calculateCarType(_car.brakeData),
            property: Car.getCarProperty(_car.brakeData),
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
            _car.timingBeltData ?? const TimingBeltData(),
            property: Car.getCarProperty(_car.timingBeltData),
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
      ),
    );

    return child;
  }
}
