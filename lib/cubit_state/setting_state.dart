import 'package:flutter/material.dart';

class SettingState {
  late double fontSize;
  late bool isBold;
  late bool isItalic;

  SettingState({
    required this.fontSize,
    required this.isBold,
    required this.isItalic,
  });

  SettingState copyWith({
    fontSize,
    isBold,
    isItalic,
  }) {
    return SettingState(
        fontSize: fontSize ?? this.fontSize,
        isBold: isBold ?? this.isBold,
        isItalic: isItalic ?? this.isItalic);
  }
}