import 'package:challenge_2/src/core/constants/app_constants.dart';

class Validator {
  static String? passwordValidator(String? value) {
    if (value!.isEmpty) return 'required';
    if (value.length < 10) {
      return 'cannot be less than 10 letters';
    } else {
      return null;
    }
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'required';
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) return 'required';
    if (AppConstants.emailRegex.hasMatch(value)) {
      return 'email address is invalid';
    } else {
      return null;
    }
  }
}
