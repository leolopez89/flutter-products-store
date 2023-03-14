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
