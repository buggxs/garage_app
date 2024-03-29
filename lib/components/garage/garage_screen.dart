import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/garage/cubit/garage_cubit.dart';
import 'package:garage_app/components/garage/widgets/car_list_item.dart';
import 'package:garage_app/components/garage/widgets/car_list_item_empty.dart';
import 'package:garage_app/components/garage/widgets/garage_meta_panel.dart';
import 'package:garage_app/components/garage/widgets/garage_slot_bottom_divider.dart';
import 'package:garage_app/components/garage/widgets/garage_slot_middle_divider.dart';
import 'package:garage_app/components/garage/widgets/garage_slot_top_divider.dart';
import 'package:garage_app/components/garage/widgets/parking_floating_button.dart';

class GarageScreen extends StatelessWidget {
  const GarageScreen({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GarageCubit>(
      create: (_) => GarageCubit()..loadGarageCars(),
      child: const GarageScreenContent(),
    );
  }
}

class GarageScreenContent extends StatelessWidget {
  const GarageScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GarageCubit cubit = context.watch<GarageCubit>();
    final GarageState state = cubit.state;

    Widget children = CarListItemEmpty(
      onTap: cubit.pushToAddCarScreen,
    );

    Widget? floatingActionButton;
    int? parkedCars;
    List<Car>? carsWithWarnings;
    String? brandList;

    if (state is GarageLoadedState) {
      parkedCars = state.cars.length;
      brandList = state.carBrandsInGarage();
      carsWithWarnings = state.carsWithWarnings();
      children = _buildCarList(cubit);

      if (state.cars.isNotEmpty) {
        if (state.cars.length < 2) {
          floatingActionButton = ParkingFloatingButton(
            onTap: cubit.pushToAddCarScreen,
          );
        }
      } else {
        floatingActionButton = ParkingFloatingButton(
          onTap: cubit.pushToAddCarScreen,
        );
      }
    }

    return GarageScaffold(
      title: 'Deine Garage',
      elevation: 0,
      floatingActionButton: floatingActionButton,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GarageMetaPanel(
            parkedCars: parkedCars,
            carsWithWarnings: carsWithWarnings,
            brandList: brandList,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Column(
                  children: <Widget>[
                    const GarageSlotTopDivider(),
                    children,
                    const GarageSlotBottomDivider(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarList(
    GarageCubit cubit,
  ) {
    final GarageLoadedState state = cubit.state as GarageLoadedState;
    final List<Car> carList = state.cars;

    List<Widget> children = <Widget>[
      CarListItemEmpty(
        onTap: cubit.pushToAddCarScreen,
      ),
      CarListItemEmpty(
        onTap: cubit.pushToAddCarScreen,
      ),
      // Const car for debugging
      /*CarListItem(
        car: constCar,
        onUpdate: cubit.updateCarData,
      ),*/
    ];

    if (carList.isNotEmpty) {
      children = carList
          .map(
            (Car car) => CarListItem(
              car: car,
              onUpdate: cubit.updateCarData,
              onDelete: cubit.deleteCar,
              onWillPop: () async {
                cubit.loadGarageCars();
                return true;
              },
            ),
          )
          .cast<Widget>()
          .toList();

      if (children.length < 2) {
        for (int i = children.length; children.length < 2; i++) {
          children.add(
            CarListItemEmpty(
              onTap: cubit.pushToAddCarScreen,
            ),
          );
        }
      }
      // Const car for debugging
      /*
      children.add(
        CarListItem(
          car: constCar,
          onUpdate: cubit.updateCarData,
        ),
      );
       */
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: children.length,
      itemBuilder: (BuildContext context, int itemIndex) => children[itemIndex],
      separatorBuilder: (BuildContext context, int index) =>
          const GarageSlotMiddleDivider(),
    );
  }
}
