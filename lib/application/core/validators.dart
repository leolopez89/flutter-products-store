import 'package:get/get.dart';

/// Validate postal code
String? postalCodeValidator(String? value) {
  RegExp regex = RegExp(r'^[0-9]{5}$');
  final val = value ?? "";
  return val.isEmpty
      ? "Required field"
      : regex.hasMatch(val)
          ? null
          : "Invalid postal code";
}

/// Validate string is not empty
String? nameValidator(String? value) {
  final val = value ?? "";
  return val.isEmpty ? "Required field" : null;
}

/// Email validator
String? emailValidator(String? value) {
  final val = value ?? "";
  return val.isEmpty
      ? "Required field"
      : val.isEmail
          ? null
          : "Invalid email";
}

/// Validate postal code
String? cardValidator(String? value) {
  RegExp regex = RegExp(r'^[0-9]{16}$');
  final val = value ?? "";
  return val.isEmpty
      ? "Required field"
      : regex.hasMatch(val)
          ? null
          : "Invalid card";
}

/// Validate postal code
String? cvvValidator(String? value) {
  RegExp regex = RegExp(r'^[0-9]{3}$');
  final val = value ?? "";
  return val.isEmpty
      ? "Required field"
      : regex.hasMatch(val)
          ? null
          : "Invalid cvv";
}

/// Validate postal code
String? dateValidator(String? value) {
  RegExp regex = RegExp(r'^[0-9][0-9]/[0-9][0-9]$');
  final val = value ?? "";
  return val.isEmpty
      ? "Required field"
      : regex.hasMatch(val)
          ? null
          : "Invalid cvv";
}
