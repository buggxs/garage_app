import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/car/documents/document_tab.dart';
import 'package:garage_app/components/car/notes/notes_tab.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/core/app_localizations.dart';

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
          backgroundColor: Colors.grey[800],
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text('${state.car.name}'),
            bottom: TabBar(
              indicatorColor: Colors.grey,
              tabs: <Widget>[
                Tab(
                  icon: const Icon(Icons.directions_car),
                  text:
                      AppLocalizations.of(context)!.translate('parking_space')!,
                  iconMargin: const EdgeInsets.all(0),
                ),
                Tab(
                  icon: const Icon(Icons.inventory_outlined),
                  text: AppLocalizations.of(context)!.translate('documents')!,
                  iconMargin: const EdgeInsets.all(0),
                ),
                Tab(
                  icon: const Icon(Icons.note_add),
                  text: AppLocalizations.of(context)!.translate('notes')!,
                  iconMargin: const EdgeInsets.all(0),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              PropertyTab(car: bloc.car),
              const DocumentTab(),
              NotesTab()
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
}
