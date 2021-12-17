import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:garage_app/components/widgets/garage_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';


class GarageScreen extends StatelessWidget {
  GarageScreen({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', 'B', '', 'D', 'E', 'F'];
  final List<int> colorCodes = <int>[600, 500, 100, 600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      title: 'Deine Garage',
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 16.0, 16.0),
        child: ListView.separated(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            if (entries[index].isEmpty) {
              return SizedBox(
                height: 115,
                width: double.infinity,
                child: garageParkingPWidget()
              );
            }
            return carCardWidget(index, context);
          },
          separatorBuilder: (BuildContext context, int index) => garageDividerWidget(),
        ),
      ),
    );
  }

  Widget garageParkingPWidget() {
    return const Center(
      child: RotatedBox(
        quarterTurns: 3,
        child: Text("P", style: TextStyle(
            color: Colors.white,
            fontSize: 98,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }

  Widget garageDividerWidget() {
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                height: 10,
                color: Colors.white,
                child: Text("")
            ),
          ),
          Container(
              height: 30,
              width: 10,
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              color: Colors.white,
              child: Text("")
          ),
        ],
      ),
    );
  }

  Widget carCardWidget(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
      child: Card(
        color: Colors.grey[400],
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => context.read<AppCubit>().showCarScreen(1, 1),
          onLongPress: () {

          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Mein cooles Auto dot com", style: TextStyle(fontSize: 18),),
                      padding: EdgeInsets.all(8.0),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.0),
                                    child: Icon(Icons.ac_unit, color: Colors.green[800], size: 20.0,),
                                  ),
                                  Text(AppLocalizations.of(context)!.air_conditioner)
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.0),
                                    child: ImageIcon(AssetImage("assets/icons/car-oil.png"), color: Colors.green[800], size: 20.0,),
                                  ),
                                  Text(AppLocalizations.of(context)!.oil)
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.0),
                                    child: ImageIcon(AssetImage("assets/icons/brake.png"), color: Colors.green[800], size: 20.0,),
                                  ),
                                  Text(AppLocalizations.of(context)!.brake)
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.0),
                                    child: ImageIcon(AssetImage("assets/icons/timing-belt.png"), color: Colors.green[800], size: 20.0,),
                                  ),
                                  Text(AppLocalizations.of(context)!.timing_belt)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
