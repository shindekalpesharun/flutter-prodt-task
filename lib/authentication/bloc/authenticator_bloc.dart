import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodt_task/authentication/bloc/authenticator_event.dart';
import 'package:prodt_task/authentication/bloc/authenticator_state.dart';
import 'package:prodt_task/authentication/repository/user_repository.dart';
import 'package:prodt_task/utils/input_validator.dart';

class AuthenticatorBloc extends Bloc<AuthenticatorEvent, AuthenticatorState> {
  final UserRepository _userRepository;

  // Constructor for AuthenticatorBloc
  AuthenticatorBloc(this._userRepository) : super(UserIntialState()) {
    // Listen for LoginUserEvent and handle authentication
    on<LoginUserEvent>((event, emit) async {
      // Emit UserLoadingState to indicate loading
      emit(UserLoadingState());

      // Check if input is a valid email or mobile number
      bool isEmail = InputValidator.isValidEmail(event.emailOrMobileNumber);
      bool isMobile = InputValidator.isValidMobile(event.emailOrMobileNumber);
      bool isPassword = InputValidator.isValidPassword(event.password);

      // Uncomment the below section to handle invalid input
      // if (!(isEmail || isMobile)) {
      //   emit(UserErrorState('Please enter a valid email or mobile number.'));
      //   return;
      // }

      // Check if password is valid
      // if (!isPassword) {
      //   emit(UserErrorState('Please enter a valid password.'));
      //   return;
      // }

      // Authenticate user using UserRepository
      if (await _userRepository.getLogin(
          event.emailOrMobileNumber, event.password)) {
        // Emit UserAuthenticatorState if authentication succeeds
        emit(UserAuthenticatorState(true));
      } else {
        // Emit UserErrorState if authentication fails
        emit(UserErrorState("Invalid credentials."));
      }
    });
  }
}
