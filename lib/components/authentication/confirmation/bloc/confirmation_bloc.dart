import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:garage_app/components/authentication/auth_repository.dart';
import 'package:meta/meta.dart';
import '../../auth_cubit.dart';
import '../../form_submission_status.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {

  ConfirmationBloc({
    required this.authRepository,
    required this.authCubit,
  }) : super(ConfirmationState());

  final AuthRepository authRepository;
  final AuthCubit authCubit;

  @override
  Stream<ConfirmationState> mapEventToState(ConfirmationEvent event) async* {

    if (event is ConfirmationCodeChanged) {
      yield state.copyWith(code: state.code);
    }

    if (event is ConfirmationSubmitted) {

      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final userId = await authRepository.confirmationSignUp(
          username: state.username,
          confirmationCode: '',
        );
        yield state.copyWith(formStatus: SubmissionSuccess());

        final credentials = authCubit.authCredentials;
        credentials!.userId = userId;

        authCubit.launchSession(credentials);

      } catch (e) {
        Exception exception = e as Exception;
        yield state.copyWith(formStatus: SubmissionFailed(exception));
      }



    }

  }
}
