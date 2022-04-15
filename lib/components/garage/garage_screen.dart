import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/api.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/garage/widgets/car_list_item.dart';
import 'package:garage_app/components/garage/widgets/car_list_item_empty.dart';
import 'package:garage_app/components/garage/widgets/garage_slot_bottom_divider.dart';
import 'package:garage_app/components/garage/widgets/garage_slot_middle_divider.dart';
import 'package:garage_app/components/garage/widgets/garage_slot_top_divider.dart';
import 'package:garage_app/components/garage/widgets/parking_floating_button.dart';

import 'bloc/garage_bloc.dart';

class GarageScreen extends StatelessWidget {
  const GarageScreen({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GarageBloc()..add(GarageLoadingParkedCars()),
      child: GarageScreenContent(),
    );
  }
}

class GarageScreenContent extends StatelessWidget {
  GarageScreenContent({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', ''];

  @override
  Widget build(BuildContext context) {
    GarageBloc bloc = context.watch<GarageBloc>();
    GarageState state = bloc.state;

    Widget child;
    Widget? floatingActionButton;

    if (state is GarageLoadedState) {
      child = _buildCarList(state.cars);
      if (state.cars.length < 2) {
        floatingActionButton = _buildFloatingButton(context);
      }
    } else {
      child = const Text('test');
    }

    return GarageScaffold(
      title: 'Deine Garage',
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 1.0, 16.0, 16.0),
        child: Column(
          children: [
            const GarageSlotTopDivider(),
            child,
            const GarageSlotBottomDivider(),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return ParkingFloatingButton(
      onTap: () => GarageBloc.of(context).add(GarageParkingCarEvent()),
    );
  }

  Widget _buildCarList(List<Car>? carList) {
    List<Widget> children = [
      const CarListItemEmpty(),
      const CarListItemEmpty(),
    ];

    if (carList?.isNotEmpty ?? false) {
      children = carList!
          .map((Car car) => CarListItem(car: car))
          .cast<Widget>()
          .toList();
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: children.length,
      itemBuilder: (BuildContext context, int itemIndex) => children[itemIndex],
      separatorBuilder: (BuildContext context, int index) =>
          const GarageSlotMiddleDivider(),
    );
  }
}
