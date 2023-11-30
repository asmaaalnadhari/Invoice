import 'package:flutter/material.dart';
//_buildSavedRow:
bool isNumeric(String? value) {
  if (value == null) {
    return false;
  }
  return double.tryParse(value) != null;
}

