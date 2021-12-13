import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:garage_app/components/authentication/auth_cubit.dart';
import 'package:garage_app/components/authentication/auth_repository.dart';
import 'package:meta/meta.dart';
import '../../form_submission_status.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  SignUpBloc({
    required this.authRepository,
    required this.authCubit,
  }) : super(SignUpState());

  final AuthRepository authRepository;
  final AuthCubit authCubit;

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {

    if (event is SignUpUsernameChanged) {
      yield state.copyWith(username: event.username);
    }

    if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);
    }

    if (event is SignUpEmailChanged) {
      yield state.copyWith(email: event.email);
    }

    if (event is SignUpSubmitted) {

      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final userId = await authRepository.signUp(
          username: state.username,
          password: state.password,
          email: state.email,
        );
        yield state.copyWith(formStatus: SubmissionSuccess());

        authCubit.showConfirmSignUp(
          username: state.username,
          email: state.email,
          password: state.password,
        );
      } catch (e) {
        Exception exception = e as Exception;
        yield state.copyWith(formStatus: SubmissionFailed(exception));
      }
    }
  }
}
