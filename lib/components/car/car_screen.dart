import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/car/documents/document_tab.dart';
import 'package:garage_app/components/car/notes/notes_tab.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/core/app_localizations.dart';
import 'package:garage_app/core/constants/constant.dart';

import 'bloc/car_bloc.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({
    Key? key,
    this.car,
  }) : super(key: key);

  static const String route = '/car';

  final Car? car;

  @override
  Widget build(BuildContext context) {
    return car != null
        ? BlocProvider(
            create: (context) => CarBloc(car: car!),
            child: const CarScreenContent(),
          )
        : const GarageScaffold(
            child: Center(
              child: Text('Empty'),
            ),
          );
  }
}

class CarScreenContent extends StatelessWidget {
  const CarScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarBloc bloc = context.watch<CarBloc>();
    CarState state = bloc.state;

    Widget child;

    if (state is CarLoaded) {
      child = DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text('${state.car.name}'),
            bottom: _tabBar(
              context: context,
              onTap: (tabIndex) => bloc.add(LoadingCarEvent(
                car: state.car,
                initialIndex: tabIndex,
              )),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              PropertyTab(car: state.car),
              const DocumentTab(),
              const NotesTab(),
            ],
          ),
        ),
      );
    } else {
      child = const GarageScaffold(
        child: Center(
          child: Text('Error'),
        ),
      );
    }

    return child;
  }

  PreferredSizeWidget _tabBar({
    required BuildContext context,
    required ValueChanged<int> onTap,
  }) {
    return TabBar(
      padding: const EdgeInsets.all(0.0),
      indicatorPadding: const EdgeInsets.all(0.0),
      indicatorColor: Colors.blueGrey[900],
      labelPadding: EdgeInsets.zero,
      onTap: onTap,
      tabs: <Widget>[
        Tab(
          height: kTabHeight,
          icon: const Icon(Icons.directions_car),
          text: AppLocalizations.of(context)!.translate('parking_space')!,
          iconMargin: const EdgeInsets.all(0),
        ),
        Tab(
          height: kTabHeight,
          icon: const Icon(Icons.inventory_outlined),
          text: AppLocalizations.of(context)!.translate('documents')!,
          iconMargin: const EdgeInsets.all(0),
        ),
        Tab(
          height: kTabHeight,
          icon: const Icon(Icons.note_add),
          text: AppLocalizations.of(context)!.translate('notes')!,
          iconMargin: const EdgeInsets.all(0),
        ),
      ],
    );
  }
}
