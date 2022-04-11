import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/components/car/documents/document_tab.dart';
import 'package:garage_app/components/car/documents/widgets/add_document_dialog.dart';
import 'package:garage_app/components/car/notes/notes_tab.dart';
import 'package:garage_app/components/car/notes/widgets/add_note_dialog.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/components/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/common/widgets/popup_service.dart';
import 'package:garage_app/core/app_localizations.dart';
import 'package:garage_app/core/app_service_locator.dart';
import 'package:garage_app/misc/constants.dart';

import 'cubit/car_cubit.dart';

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
            create: (context) =>
                CarCubit(car: car!)..emit(CarLoadedState(car: car!)),
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
    CarCubit cubit = context.watch<CarCubit>();
    CarState state = cubit.state;

    Widget child;

    if (state is CarLoadedState) {
      print(state.tabIndex);

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
              onTap: cubit.updateTab,
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              PropertyTab(car: state.car),
              DocumentTab(car: state.car),
              NotesTab(car: state.car),
            ],
          ),
          floatingActionButton: _showActionButton(context, state),
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
          icon: const Icon(Icons.sticky_note_2),
          text: AppLocalizations.of(context)!.translate('notes')!,
          iconMargin: const EdgeInsets.all(0),
        ),
      ],
    );
  }

  Widget? _showActionButton(BuildContext context, CarLoadedState state) {
    CarCubit cubit = context.watch<CarCubit>();
    switch (state.tabIndex) {
      case 0:
        return null;
      case 1:
        return FloatingActionButton(
          onPressed: () async {
            final Map<String, dynamic> documentData =
                await app<PopupService>().showPopUp(
              context,
              const Text('Dokument hinzufügen'),
              AddDocumentDialog(),
            );
            cubit.addDocumentToCar(documentData);
          },
          child: const Icon(Icons.inventory_outlined),
        );
      case 2:
        return FloatingActionButton(
          onPressed: () async {
            String? noteText = await app<PopupService>().showPopUp(
              context,
              const Text('Notiz hinzufügen'),
              AddNoteDialog(),
            );
            cubit.addNoteToCar(noteText);
          },
          child: const Icon(Icons.sticky_note_2_outlined),
        );
      default:
        return null;
    }
  }
}
