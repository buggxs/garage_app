import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/car/documents/document_tab.dart';
import 'package:garage_app/components/car/notes/notes_tab.dart';
import 'package:garage_app/components/car/properties/property_tab.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';

import 'bloc/car_bloc.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'assets/img/bmw.jpeg',
      'assets/img/bmw2.jpeg',
      'assets/img/bmw3.jpg',
    ];

    CarBloc bloc = context.watch<CarBloc>();
    CarState state = bloc.state;

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.read<AppCubit>().showGarageScreen(1),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text("MyCar"),
          bottom: const TabBar(
            indicatorColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car),
                text: "Stellplatz",
                iconMargin: EdgeInsets.all(0),
              ),
              Tab(
                icon: Icon(Icons.inventory_outlined),
                text: "Dokumente",
                iconMargin: EdgeInsets.all(0),
              ),
              Tab(
                icon: Icon(Icons.note_add),
                text: "Notizen",
                iconMargin: EdgeInsets.all(0),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            PropertyTab(car: bloc.car),
            DocumentTab(),
            NotesTab()
          ],
        ),
      ),
    );
  }
}
