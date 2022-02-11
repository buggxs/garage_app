import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/car/model/car.dart';
import 'package:garage_app/components/garage/widgets/car_list_item.dart';
import 'package:garage_app/components/garage/widgets/car_list_item_empty.dart';
import 'package:garage_app/components/garage/widgets/parking_floating_button.dart';

import 'bloc/garage_bloc.dart';

class GarageScreen extends StatelessWidget {
  GarageScreen({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', ''];

  @override
  Widget build(BuildContext context) {
    GarageBloc bloc = context.watch<GarageBloc>();
    GarageState state = bloc.state;

    Widget? child;

    if (state is GarageLoadedState) {
      child = _buildCarList(state.cars);
    }

    return GarageScaffold(
      title: 'Deine Garage',
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 16.0, 16.0),
        child: child,
      ),
      floatingActionButton: ParkingFloatingButton(
        onTap: () => GarageBloc.of(context).add(GarageParkingCarEvent()),
      ),
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
