import 'app_regx.dart';

abstract class Validations {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!AppRegex.isEmailValid(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!AppRegex.hasMinLength(value)) {
      return 'Password must be at least 8 characters';
    }
    if (!AppRegex.hasNumber(value)) {
      return 'Password must contain at least one number';
    }
    if (!AppRegex.hasSpecialCharacter(value)) {
      return 'Password must contain at least one special character (@\$!%*#?&)';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!AppRegex.isPhoneNumberValid(value)) {
      return 'Enter a valid Egyptian phone number';
    }
    return null;
  }

  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? confirmPassword(String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
