import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/confirmation/confirmation_screen.dart';
import 'package:garage_app/components/authentication/login/login_screen.dart';
import 'package:garage_app/components/authentication/sign_up/sign_up_screen.dart';

import 'auth_cubit.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            // Show login
            if (state == AuthState.login) MaterialPage(child: LoginScreen()),

            // Allow push animation
            if (state == AuthState.signUp ||
              state == AuthState.confirmSignUp) ...[

                // Show sign up
                MaterialPage(child: SignUpScreen()),

                // Show confirm sign up
                if (state == AuthState.confirmSignUp)
                  MaterialPage(child: ConfirmationScreen()),
            ],

          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      }
    );
  }
}
