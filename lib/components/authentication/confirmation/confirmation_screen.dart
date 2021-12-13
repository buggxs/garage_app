import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/form_submission_status.dart';
import 'package:garage_app/components/authentication/confirmation/bloc/confirmation_bloc.dart';
import 'package:garage_app/components/authentication/auth_repository.dart';

import '../auth_cubit.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ConfirmationBloc(
          authRepository: context.read<AuthRepository>(),
          authCubit: context.read<AuthCubit>(),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _formWidget(),
          ],
        ),
      ),
    );
  }


  Widget _formWidget() {
    return BlocListener<ConfirmationBloc, ConfirmationState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _confirmationField(),
              _confirmButton()
            ],
          ),
        ),
      ),
    );
  }



  Widget _confirmationField() {
    return BlocBuilder<ConfirmationBloc, ConfirmationState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.security),
              hintText: 'Confirmation code'
          ),
          validator: (value) => state.isValidCode ? null:'Code is invalid',
          onChanged: (value) => context.read<ConfirmationBloc>()
              .add(ConfirmationCodeChanged(code: value)),
        );
      },
    );
  }


  Widget _confirmButton() {
    return BlocBuilder<ConfirmationBloc, ConfirmationState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting ?
          ElevatedButton(
            onPressed: () {},
            child: const CircularProgressIndicator(),
          )
        : ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                context.read<ConfirmationBloc>().add(ConfirmationSubmitted());
              }
            },
            child: const Text('Confirm')
          );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
