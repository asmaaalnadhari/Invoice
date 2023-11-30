import 'package:flutter/material.dart';
InputDecoration buildInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle:const TextStyle(color: Colors.black54) ,
    border: InputBorder.none,
  );
}
