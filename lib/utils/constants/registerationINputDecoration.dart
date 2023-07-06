import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration textFieldStyle(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      labelText: labelTextStr,
      hintText: hintTextStr,
      errorStyle: TextStyle(height: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
