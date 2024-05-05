import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Define an abstract class for authenticator states
@immutable
abstract class AuthenticatorState extends Equatable {}

// Define an initial state for the authenticator
class UserIntialState extends AuthenticatorState {
  @override
  List<Object?> get props => [];
}

// Define a loading state for the authenticator
class UserLoadingState extends AuthenticatorState {
  @override
  List<Object?> get props => [];
}

// Define a state indicating successful authentication
class UserAuthenticatorState extends AuthenticatorState {
  // Constructor to initialize the authentication status
  UserAuthenticatorState(this.isAuthenticated);

  final bool isAuthenticated; // Indicates whether the user is authenticated

  @override
  List<Object?> get props => [];
}

// Define a state for authentication errors
class UserErrorState extends AuthenticatorState {
  // Constructor to initialize the error message
  UserErrorState(this.error);

  final String
      error; // Error message indicating the cause of authentication failure

  @override
  List<Object?> get props => [error];
}
