class InputValidator {
  // Define regular expressions outside of the methods to avoid recreating them on every method call
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final RegExp _mobileRegex = RegExp(r'^\d{10}$');
  static final RegExp _uppercaseRegex = RegExp(r'[A-Z]');
  static final RegExp _lowercaseRegex = RegExp(r'[a-z]');
  static final RegExp _digitRegex = RegExp(r'[0-9]');

  // Check if the input string is a valid email address
  static bool isValidEmail(String input) {
    return _emailRegex.hasMatch(input);
  }

  // Check if the input string is a valid mobile number
  static bool isValidMobile(String input) {
    return _mobileRegex.hasMatch(input);
  }

  // Check if the input string is a valid password
  static bool isValidPassword(String input) {
    // Check if password length is at least 6 characters
    if (input.length < 6) return false;

    // Check for strong password requirements
    // Example: At least one uppercase letter, one lowercase letter, and one digit
    return _uppercaseRegex.hasMatch(input) &&
        _lowercaseRegex.hasMatch(input) &&
        _digitRegex.hasMatch(input);
  }
}
