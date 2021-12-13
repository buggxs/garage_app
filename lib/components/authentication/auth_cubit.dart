
import 'package:bloc/bloc.dart';
import 'package:garage_app/components/authentication/session/session_cubit.dart';

import 'auth_credentials.dart';

enum AuthState { login, signUp, confirmSignUp }

class AuthCubit extends Cubit<AuthState> {
  
  AuthCubit({this.sessionCubit}) : super(AuthState.login);
  
  AuthCredentials? authCredentials;
  SessionCubit? sessionCubit;
  
  void showLogin() => emit(AuthState.login);
  void showSignUp() => emit(AuthState.signUp);
  
  void showConfirmSignUp({
    required String username,
    required String email,
    required String password,
  }) {
    authCredentials = AuthCredentials(
      username: username,
      email: email,
      password: password
    );
    emit(AuthState.confirmSignUp);
  }

  void launchSession(AuthCredentials authCredentials) {
    sessionCubit!.showSession(authCredentials);
  }
  
}