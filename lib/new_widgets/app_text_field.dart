import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studentpanel/new_widgets/text_fields.dart';
import 'package:studentpanel/utils/theme.dart';

import '../utils/constants.dart';

enum Validator {
  phone,
  email,
  password,
  notEmpty,
  otp,
  plzSelectOne,
  cgpa,
  multiplier,
  percentage,
  duolingoDefinite
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.title,
    this.hint,
    this.validateMsg,
    this.validate = false,
    this.enabled = true,
    this.validator,
    this.obscureText = false,
    this.icon,
    this.maxLines = 1,
    this.suffixIcon,
    this.keyboardType,
    this.inputAction,
    this.boxColor,
    this.isDense = true,
    this.readOnly = false,
    this.showTitle = true,
    this.fillColor = Colors.white,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.borderRadius = 0.0,
  });

  final TextEditingController controller;
  final double borderRadius;
  final String title;
  final String? hint;
  final String? validateMsg;
  final bool validate;
  final bool enabled;
  final Validator? validator;
  final Color? boxColor;
  final bool obscureText;
  final int maxLines;
  final Widget? icon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final bool isDense;
  final bool readOnly;
  final bool showTitle;
  final Color fillColor;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onFieldSubmitted;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(title,
                style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w800)),
          ),
        if (showTitle) const SizedBox(height: 9),
        Material(
          elevation: 1.8,
          shadowColor: Colors.transparent,
          color: boxColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: buttonStyleOpenSans(
                ThemeConstants.blackcolor, FontWeight.w500, 14),
            cursorColor: ThemeConstants.greenColor,
            controller: controller,
            validator: (value) {
              if (Validator.phone == validator) {
                return getPhoneNumbervalidation(value);
              } else if (Validator.email == validator) {
                return getEmailvaliation(value);
              } else if (Validator.password == validator) {
                return validatePassword('$value');
              } else if (Validator.notEmpty == validator) {
                return getEmptyValidation(value);
              } else if (Validator.otp == validator) {
                return getOtpvalidation(value);
              } else if (Validator.plzSelectOne == validator) {
                return getEmptyDropDownValidation(value);
              } else if (Validator.cgpa == validator) {
                return getCGPAValidation(value);
              } else if (Validator.multiplier == validator) {
                return getMultiplierValidation(value);
              } else if (Validator.percentage == validator) {
                return getPercentageValidation(value);
              } else if (Validator.duolingoDefinite == validator) {
                return getDuolingoDefinite(value);
              } else {
                return null;
              }
            },
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            textInputAction: inputAction,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
            enabled: enabled,
            decoration: InputDecoration(
              isDense: isDense,
              labelText: hint,
              labelStyle:
                  TextStyle(color: ThemeConstants.blackcolor, fontSize: 14),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(color: ThemeConstants.TextColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(color: ThemeConstants.blackcolor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(color: ThemeConstants.TextColor)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              hintText: hint ?? '$title/*.toLowerCase()*/',
              hintStyle: buttonStyleOpenSans(
                  ThemeConstants.TextColor, FontWeight.w500, 14),
              filled: true,
              fillColor: Colors.transparent,
              //fillColor,//K.disabledColor,
              prefixIcon: icon,
              suffixIcon: suffixIcon,
            ),
            onFieldSubmitted: onFieldSubmitted,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
