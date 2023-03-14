import 'package:flutter/material.dart';

InputDecoration fieldDecoration({
  String? labelText,
  String? hintText,
  Widget? prefixIcon,
  BorderMode mode = BorderMode.single,
}) =>
    InputDecoration(
        contentPadding: const EdgeInsets.all(25),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        prefix: const SizedBox(width: 10),
        focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.lineColor, width: 0.5),
            borderRadius: customBorder(mode)),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.lineColor, width: 0.5),
            borderRadius: customBorder(mode)),
        errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.lineColor, width: 0.5),
            borderRadius: customBorder(mode)),
        border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.lineColor, width: 0.5),
            borderRadius: customBorder(mode)),
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: AppColors.textColor, fontWeight: FontWeight.w600));

enum BorderMode { top, center, end, single }

BorderRadius customBorder(BorderMode mode) {
  BorderRadius radius = BorderRadius.zero;
  switch (mode) {
    case BorderMode.top:
      radius = const BorderRadius.vertical(top: Radius.circular(5));
      break;
    case BorderMode.center:
      radius = BorderRadius.zero;
      break;
    case BorderMode.end:
      radius = const BorderRadius.vertical(bottom: Radius.circular(5));
      break;
    case BorderMode.single:
      radius = BorderRadius.circular(5);
      break;
  }
  return radius;
}

mixin AppColors {
  static const Color mainColor = Color(0XFF33C283);
  static const Color backgroundColor = Color(0xFFF3F3F3);
  static const Color textColor = Color(0xFF8C8C8C);
  static const Color lineColor = Color(0xFFD2D2D2);
  static const Color baseTextColor = Color(0XFFFAFAFA);

  static const Color textColor2 = Color(0xFF474747);
  static const Color disabledColor = Color(0xFFE3E3E3);
  static const Color inactiveColor = Color(0xFFB8B8B8);
  static const Color alelrtColor = Color(0xFFE94335);
}
