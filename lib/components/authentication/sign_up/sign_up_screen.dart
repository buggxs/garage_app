import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/form_submission_status.dart';
import 'package:garage_app/components/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:garage_app/components/authentication/auth_repository.dart';

import '../auth_cubit.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpBloc(
          authRepository: context.read<AuthRepository>(),
          authCubit: context.read<AuthCubit>(),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _formWidget(),
            _showSignUpButton(context,)
          ],
        ),
      ),
    );
  }


  Widget _formWidget() {
    return BlocListener<SignUpBloc, SignUpState>(
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
              _usernameField(),
              _emailField(),
              _passwordField(),
              _signUpButton()
            ],
          ),
        ),
      ),
    );
  }



  Widget _usernameField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Username'
          ),
          validator: (value) => null,
          onChanged: (value) => context.read<SignUpBloc>()
              .add(SignUpUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _emailField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.alternate_email),
              hintText: 'Email'
          ),
          validator: (value) => null,
          onChanged: (value) => context.read<SignUpBloc>()
              .add(SignUpEmailChanged(email: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.security),
            hintText: 'Password'
          ),
          validator: (value) => null,
          onChanged: (value) => context.read<SignUpBloc>()
              .add(SignUpPasswordChanged(password: value)),
        );
      },
    );
  }


  Widget _signUpButton() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting ?
          ElevatedButton(
            onPressed: () {},
            child: const CircularProgressIndicator(),
          )
        : ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                context.read<SignUpBloc>().add(SignUpSubmitted());
              }
            },
            child: const Text('SignUp')
          );
      },
    );
  }


  Widget _showSignUpButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
        child: const Text('Already have an account? Sign in!'),
        onPressed: () {
          context.read<AuthCubit>().showLogin();
        },
      )
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
