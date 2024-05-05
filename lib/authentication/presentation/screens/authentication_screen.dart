import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prodt_task/authentication/bloc/authenticator_bloc.dart';
import 'package:prodt_task/authentication/bloc/authenticator_event.dart';
import 'package:prodt_task/authentication/bloc/authenticator_state.dart';
import 'package:prodt_task/authentication/presentation/component/ButtonBookmarkComponent.dart';
import 'package:prodt_task/core/bloc/connectivity_bloc/ConnectivityBloc.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});

  // Controllers for email and password text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _initializeDefaultValues(); // Initialize default values for email and password fields

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocBuilder<ConnectivityBloc, ConnectivityStatus>(
        builder: (context, connectivityStatus) {
          if (connectivityStatus == ConnectivityStatus.connected) {
            return _buildConnectedState(context);
          } else {
            return ButtonBookmarkComponent();
          }
        },
      ),
    );
  }

  // Method to initialize default values for email and password fields
  void _initializeDefaultValues() {
    _usernameController.text = "admin@dev.com";
    _passwordController.text = "admin";
  }

  // Widget to build UI when device is connected
  Widget _buildConnectedState(BuildContext context) {
    return BlocConsumer<AuthenticatorBloc, AuthenticatorState>(
      listener: (context, state) {
        if (state is UserAuthenticatorState) {
          context.go("/home");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Email/Mobile',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthenticatorBloc>(context).add(
                    LoginUserEvent(
                      _usernameController.text,
                      _passwordController.text,
                    ),
                  );
                },
                child: BlocBuilder<AuthenticatorBloc, AuthenticatorState>(
                  builder: (context, state) {
                    if (state is UserLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Text('Login');
                    }
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<AuthenticatorBloc, AuthenticatorState>(
                builder: (context, state) {
                  if (state is UserErrorState) {
                    return Text(state.error);
                  }
                  return Container();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
