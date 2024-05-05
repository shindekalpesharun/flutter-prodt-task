import 'package:equatable/equatable.dart';

// Define an abstract class for authenticator events
abstract class AuthenticatorEvent extends Equatable {
  const AuthenticatorEvent();
}

// Define a concrete event class for user login
class LoginUserEvent extends AuthenticatorEvent {
  final String emailOrMobileNumber;
  final String password;

  // Constructor for LoginUserEvent
  const LoginUserEvent(this.emailOrMobileNumber, this.password);

  // Override the props getter to ensure objects of this class can be compared for equality
  @override
  List<Object> get props => [];
}