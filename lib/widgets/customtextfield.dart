import 'package:flutter/material.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  Validator? validator;
  TextInputType? keybord;
  bool? obscureText = false;
  bool? readOrEdit = false;
  Color? backgroundCOlour;
  FontWeight? hintFontWeight;
  bool? forDropDown;
  CustomTextField({
    Key? key,
    this.hintFontWeight,
    this.forDropDown = true,
    this.backgroundCOlour,
    required this.hint,
    required this.controller,
    this.obscureText,
    this.readOrEdit,
    this.validator,
    this.keybord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText ?? false,
        keyboardType: keybord ?? TextInputType.text,
        controller: controller,
        scrollPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).viewInsets.bottom + 30),
        style: ThemeConstants.montserrattextstyle2,
        readOnly: readOrEdit == null ? false : readOrEdit!,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          hintText: hint,
          hintStyle: TextStyle(fontWeight: hintFontWeight ?? FontWeight.w500),
          filled: true,
          fillColor: backgroundCOlour ?? ThemeConstants.ultraLightgreyColor,
          errorBorder: OutlineInputBorder(
            borderRadius: forDropDown!
                ? BorderRadius.circular(200)
                : BorderRadius.circular(0),
            borderSide: BorderSide(
                color: forDropDown! ? Colors.red : Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: forDropDown! ? 1 : 0,
                color: forDropDown!
                    ? ThemeConstants.lightgreycolor
                    : Colors.transparent),
            borderRadius: forDropDown!
                ? BorderRadius.circular(200)
                : BorderRadius.circular(0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: forDropDown! ? 1 : 0,
                color: forDropDown!
                    ? ThemeConstants.lightgreycolor
                    : Colors.transparent),
            borderRadius: forDropDown!
                ? BorderRadius.circular(200)
                : BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: forDropDown! ? 1 : 0,
                color: forDropDown!
                    ? ThemeConstants.lightgreycolor
                    : Colors.transparent),
            borderRadius: forDropDown!
                ? BorderRadius.circular(200)
                : BorderRadius.circular(0),
          ),
        ),
        validator: (value) {
          if (Validator.phone == validator) {
            return getPhoneNumbervalidation(value);
          } else if (Validator.email == validator) {
            return getEmailvaliation(value);
          } else if (Validator.password == validator) {
            print("password");
          } else if (Validator.notEmpty == validator) {
            return getEmptyValidation(value);
          } else if (Validator.otp == validator) {
            return getOtpvalidation(value);
          } else if (Validator.plzSelectOne == validator) {
            return getEmptyDropDownValidation(value);
          }
          return null;
        });
  }
}

enum Validator { phone, email, password, notEmpty, otp, plzSelectOne }
