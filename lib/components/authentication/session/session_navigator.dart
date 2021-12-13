import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/core/app_navigator/app_cubit.dart';
import 'package:garage_app/core/app_navigator/app_navigator.dart';

import 'session_cubit.dart';
import '../auth_cubit.dart';
import '../auth_navigator.dart';
import '../../loading_view.dart';

class SessionNavigator extends StatelessWidget {
  const SessionNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              // Show loading screen
              if (state is UnknownSessionState)
                const MaterialPage(
                  child: LoadingScreen(),
                ),

              // Show auth flow
              if (state is Unauthenticated)
                MaterialPage(
                  child: BlocProvider(
                    create: (context) => AuthCubit(
                      sessionCubit: context.read<SessionCubit>(),
                    ),
                    child: const AuthNavigator(),
                  ),
                ),

              // Show session flow
              if (state is Authenticated)
                MaterialPage(
                  child: BlocProvider(
                    create: (context) => AppCubit(
                      sessionCubit: context.read<SessionCubit>(),
                    ),
                    child: const AppNavigator(),
                  )
                ),
            ],
            onPopPage: (route, result) => route.didPop(result),
          );
        }
    );
  }
}
