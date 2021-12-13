import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/components/authentication/form_submission_status.dart';
import 'package:garage_app/components/authentication/login/bloc/login_bloc.dart';
import 'package:garage_app/components/authentication/auth_repository.dart';

import '../auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
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
    return BlocListener<LoginBloc, LoginState>(
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
              _passwordField(),
              _loginButton()
            ],
          ),
        ),
      ),
    );
  }



  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Username'
          ),
          validator: (value) => null,
          onChanged: (value) => context.read<LoginBloc>()
              .add(LoginUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.security),
            hintText: 'Password'
          ),
          validator: (value) => null,
          onChanged: (value) => context.read<LoginBloc>()
              .add(LoginPasswordChanged(password: value)),
        );
      },
    );
  }


  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting ?
          ElevatedButton(
            onPressed: () {},
            child: CircularProgressIndicator(),
          )
        : ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginSubmitted());
              }
            },
            child: const Text('Login')
          );
      },
    );
  }


  Widget _showSignUpButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
        child: const Text('Dont have an account? Sign up!'),
        onPressed: () {
          context.read<AuthCubit>().showSignUp();
        },
      )
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
