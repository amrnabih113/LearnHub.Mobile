import 'my_texts.dart';

class MyValidator {
  MyValidator._();

  // ============================================================
  // EMPTY
  // ============================================================

  static String? validateEmptyText(
    String? fieldName,
    String? text,
  ) {
    if (text == null || text.trim().isEmpty) {
      return MyTexts.errorFieldRequired;
    }

    return null;
  }

  // ============================================================
  // EMAIL
  // ============================================================

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return MyTexts.errorEmailRequired;
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(email.trim())) {
      return MyTexts.errorEmailInvalid;
    }

    return null;
  }

  // ============================================================
  // PASSWORD
  // ============================================================

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return MyTexts.errorPasswordRequired;
    }

    if (password.length < 6) {
      return MyTexts.errorPasswordShort;
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return MyTexts.errorPasswordUppercase;
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return MyTexts.errorPasswordNumber;
    }

    return null;
  }

  // ============================================================
  // PHONE
  // ============================================================

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return MyTexts.errorPhoneRequired;
    }

    final phoneNumberRegex = RegExp(r'^\d{11}$');

    if (!phoneNumberRegex.hasMatch(phoneNumber)) {
      return MyTexts.errorPhoneInvalid;
    }

    return null;
  }

  // ============================================================
  // CONFIRM PASSWORD
  // ============================================================

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return MyTexts.errorConfirmPasswordRequired;
    }

    if (password != confirmPassword) {
      return MyTexts.errorPasswordsNotMatch;
    }

    return null;
  }

  // ============================================================
  // USERNAME
  // ============================================================

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return MyTexts.errorUsernameRequired;
    }

    if (value.contains('@')) {
      return MyTexts.errorUsernameAt;
    }

    if (value.trim().length < 3) {
      return MyTexts.errorUsernameShort;
    }

    return null;
  }
}