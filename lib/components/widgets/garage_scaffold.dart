import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';

class GarageScaffold extends StatelessWidget {
  const GarageScaffold({
    Key? key,
    required this.child,
    this.title
  }) : super(key: key);

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text(title ?? 'MyGarage App'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: const Icon(Icons.logout),
                  onTap: () => BlocProvider.of<SessionCubit>(context).signOut(),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.grey[800],
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Dashboard'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.garage),
                label: 'Garage'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
              ),
            ],
            currentIndex: state.bottomNavigationIndex!,
            selectedItemColor: Colors.amber[800],
            onTap: context.read<AppCubit>().navigateTo,
          ),
        );
      },
    );
  }
}
