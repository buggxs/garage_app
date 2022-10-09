import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/common/widgets/garage_scaffold.dart';
import 'package:garage_app/common/widgets/popup_service.dart';
import 'package:garage_app/components/car/documents/document_tab.dart';
import 'package:garage_app/components/car/documents/widgets/add_document_dialog.dart';
import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/components/car/i18n/car_text.dart';
import 'package:garage_app/components/car/notes/notes_tab.dart';
import 'package:garage_app/components/car/notes/widgets/add_note_dialog.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
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
        ? BlocProvider<CarCubit>(
            create: (context) => CarCubit(car: car!),
            child: const CarScreenTabs(),
          )
        : const GarageScaffold(
            child: Center(
              child: Text('Empty'),
            ),
          );
  }
}

class CarScreenTabs extends StatefulWidget {
  const CarScreenTabs({Key? key}) : super(key: key);

  @override
  State<CarScreenTabs> createState() => _CarScreenTabsState();
}

class _CarScreenTabsState extends State<CarScreenTabs>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  int tabIndex = 0;

  @override
  void initState() {
    _controller = TabController(
      length: 3,
      vsync: this,
      initialIndex: tabIndex,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CarCubit cubit = context.watch<CarCubit>();
    CarState state = cubit.state;

    Widget child = Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('${state.car?.name}'),
        bottom: _tabBar(
          context: context,
          onTap: cubit.updateTab,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          const PropertyTab(),
          DocumentTab(car: state.car),
          NotesTab(car: state.car),
        ],
      ),
      floatingActionButton: _showActionButton(
        context: context,
        index: state.tabIndex,
      ),
    );

    if (state is CarErrorState) {
      child = GarageScaffold(
        child: Center(
          child: Text(state.error ?? 'Error'),
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
      controller: _controller,
      padding: const EdgeInsets.all(0.0),
      indicatorPadding: const EdgeInsets.all(0.0),
      indicatorColor: Colors.blueGrey[900],
      labelPadding: EdgeInsets.zero,
      onTap: onTap,
      tabs: <Widget>[
        Tab(
          height: kTabHeight,
          icon: const Icon(Icons.directions_car),
          text: CarText.parkingSpace(),
          iconMargin: const EdgeInsets.all(0),
        ),
        Tab(
          height: kTabHeight,
          icon: const Icon(Icons.inventory_outlined),
          text: CarText.documents(),
          iconMargin: const EdgeInsets.all(0),
        ),
        Tab(
          height: kTabHeight,
          icon: const Icon(Icons.sticky_note_2),
          text: CarText.notes(),
          iconMargin: const EdgeInsets.all(0),
        ),
      ],
    );
  }

  Widget? _showActionButton({required BuildContext context, int? index = 0}) {
    CarCubit cubit = context.watch<CarCubit>();
    print('from _showActionButton $index');
    switch (index) {
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

class MyFloatingActionButtons extends StatefulWidget {
  const MyFloatingActionButtons({Key? key, this.index}) : super(key: key);

  final int? index;

  @override
  State<MyFloatingActionButtons> createState() =>
      _MyFloatingActionButtonsState();
}

class _MyFloatingActionButtonsState extends State<MyFloatingActionButtons> {
  @override
  Widget build(BuildContext context) {
    CarCubit cubit = context.watch<CarCubit>();
    switch (widget.index) {
      case 0:
        return const SizedBox();
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
        return const SizedBox();
    }
  }
}
