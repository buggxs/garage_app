import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';

class GarageScaffold extends StatelessWidget {
  const GarageScaffold({
    Key? key,
    required this.child,
    this.floatingActionButton,
    this.title
  }) : super(key: key);

  final Widget child;
  final String? title;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text(title ?? 'MyGarage App',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            actions: [
              _buildLogoutAction(context)
            ],
          ),
          backgroundColor: Colors.blueGrey[900],
          body: child,
          floatingActionButton: floatingActionButton,
        );
      },
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context, AppState state) {
    return BottomNavigationBar(
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
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.blueGrey[900],
      onTap: context.read<AppCubit>().navigateTo,
    );
  }

  Widget _buildLogoutAction(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AppCubit>().sessionCubit.signOut();
      },
      child: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(Icons.logout),
      ),
    );
  }

  Widget _buildPointAction() {
    return InkWell(
      onTap: () {
        print("Hello");
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FittedBox(
                child: Icon(Icons.garage, size: 25,)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text("40",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}