import 'package:my_learning_app/utils/utils.dart';

class FormValidator {
  static String? validateEmail(String? value) {
    if (!value!.contains(RegexHelper.emailRegex)) {
      return 'Please enter email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter password';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter name';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (!value!.contains(RegexHelper.digitsOnlyRegex)) {
      return 'Please enter phone number  ';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value!.isEmpty) {
      return 'Please enter address';
    }
    return null;
  }
}
