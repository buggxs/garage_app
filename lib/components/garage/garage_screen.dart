import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/garage/widgets/car_list_item.dart';
import 'package:garage_app/components/garage/widgets/car_list_item_empty.dart';
import 'package:garage_app/components/garage/widgets/parking_floating_button.dart';

import 'cubit/garage_cubit.dart';

class GarageScreen extends StatelessWidget {
  const GarageScreen({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GarageCubit(),
      child: GarageScreenContent(),
    );
  }
}

class GarageScreenContent extends StatelessWidget {
  GarageScreenContent({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', ''];

  @override
  Widget build(BuildContext context) {
    GarageCubit cubit = context.watch<GarageCubit>();
    GarageState state = cubit.state;

    Widget? child;
    Widget? floatingActionButton;

    if (state is GarageLoadedState) {
      child = _buildCarList(state.carList);
      if (state.carList.length < 2) {
        floatingActionButton = _buildFloatingButton(context);
      }
    }

    return GarageScaffold(
      title: 'Deine Garage',
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 16.0, 16.0),
        child: child,
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return ParkingFloatingButton(
      onTap: () => print('test'),
    );
  }

  Widget _buildCarList(List<Car> carList) {
    List<Widget> children =
        carList.map((Car car) => CarListItem(car: car)).cast<Widget>().toList();

    // After the last Car add an empty Parking-slot
    children.add(const CarListItemEmpty());

    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (BuildContext context, int itemIndex) => children[itemIndex],
    );
  }
}
