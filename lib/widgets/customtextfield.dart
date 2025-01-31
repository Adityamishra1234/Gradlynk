import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/field_validators.dart';
import 'package:studentpanel/utils/theme.dart';

import '../utils/snackbarconstants.dart';

// class CustomTextField extends StatelessWidget {
//   TextEditingController controller;
//   String hint;
//   Validator? validator;
//   TextInputType? keybord;
//   bool? obscureText = false;
//   bool? readOrEdit = false;
//   Color? backgroundCOlour;
//   FontWeight? hintFontWeight;
//   double? borderRadius;
//   FontWeight? fieldFontWeight;
//   bool? forDropDown;
//   CustomTextField({
//     Key? key,
//     this.fieldFontWeight,
//     this.borderRadius,
//     this.hintFontWeight,
//     this.forDropDown = true,
//     this.backgroundCOlour,
//     required this.hint,
//     required this.controller,
//     this.obscureText,
//     this.readOrEdit,
//     this.validator,
//     this.keybord,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         obscureText: obscureText ?? false,
//         keyboardType: keybord ?? TextInputType.text,
//         controller: controller,
//         scrollPadding: EdgeInsets.symmetric(
//             vertical: MediaQuery.of(context).viewInsets.bottom + 30),
//         style: GoogleFonts.montserrat(
//           fontWeight: fieldFontWeight ?? FontWeight.w500,
//         ),
//         readOnly: readOrEdit == null ? false : readOrEdit!,
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           hintText: hint,
//           hintStyle: TextStyle(fontWeight: hintFontWeight ?? FontWeight.w500),
//           filled: true,
//           fillColor: backgroundCOlour ?? ThemeConstants.ultraLightgreyColor,
//           errorBorder: OutlineInputBorder(
//             borderRadius: forDropDown!
//                 ? BorderRadius.circular(borderRadius ?? 200)
//                 : BorderRadius.circular(0),
//             borderSide: BorderSide(
//                 color: forDropDown! ? Colors.red : Colors.transparent),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 width: forDropDown! ? 1 : 0,
//                 color: forDropDown!
//                     ? ThemeConstants.lightgreycolor
//                     : Colors.transparent),
//             borderRadius: forDropDown!
//                 ? BorderRadius.circular(borderRadius ?? 200)
//                 : BorderRadius.circular(0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 width: forDropDown! ? 0 : 0,
//                 color: forDropDown!
//                     ? ThemeConstants.lightgreycolor
//                     : Colors.transparent),
//             borderRadius: forDropDown!
//                 ? BorderRadius.circular(borderRadius ?? 10)
//                 : BorderRadius.circular(0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 width: forDropDown! ? 1 : 0,
//                 color: forDropDown!
//                     ? ThemeConstants.lightgreycolor
//                     : Colors.transparent),
//             borderRadius: forDropDown!
//                 ? BorderRadius.circular(borderRadius ?? 200)
//                 : BorderRadius.circular(0),
//           ),
//         ),
//         validator: (value) {
//           FieldValidators fieldValidator = FieldValidators();
//
//           if (Validator.phone == validator) {
//             return getPhoneNumbervalidation(value);
//           } else if (Validator.email == validator) {
//             return fieldValidator.getEmailvaliation(value);
//           } else if (Validator.password == validator) {
//             print("password");
//           } else if (Validator.notEmpty == validator) {
//             return getEmptyValidation(value);
//           } else if (Validator.otp == validator) {
//             return getOtpvalidation(value);
//           } else if (Validator.plzSelectOne == validator) {
//             return getEmptyDropDownValidation(value);
//           }
//           return null;
//         });
//   }
// }

enum Validator { phone, email, password, notEmpty, otp, plzSelectOne, cgpa , multiplier, percentage, duolingoDefinite}

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  Validator? validator;
  TextInputType? keybord;
  bool? obscureText = false;
  bool? readOrEdit = false;
  Color? backgroundCOlour;
  FontWeight? hintFontWeight;
  double? borderRadius;
  FontWeight? fieldFontWeight;
  bool? forDropDown;
  CustomTextField({
    Key? key,
    this.fieldFontWeight,
    this.borderRadius,
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
        style: GoogleFonts.montserrat(
          fontWeight: fieldFontWeight ?? FontWeight.w500,
        ),
        readOnly: readOrEdit == null ? false : readOrEdit!,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          hintText: hint,
          hintStyle: TextStyle(fontWeight: hintFontWeight ?? FontWeight.w500),
          filled: true,
          fillColor: ThemeConstants.whitecolor,
          errorBorder: UnderlineInputBorder(
            borderRadius: forDropDown!
                ? BorderRadius.circular(0)
                : BorderRadius.circular(0),
            borderSide: BorderSide(
                color: forDropDown! ? Colors.red : Colors.transparent),
          ),
          // focusedErrorBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(
          //       width: forDropDown! ? 1 : 0,
          //       color: forDropDown!
          //           ? ThemeConstants.lightgreycolor
          //           : Colors.transparent),
          //   borderRadius: forDropDown!
          //       ? BorderRadius.circular(borderRadius ?? 200)
          //       : BorderRadius.circular(0),
          // ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: forDropDown! ? 0 : 0,
                color: forDropDown!
                    ? ThemeConstants.blackcolor
                    : Colors.transparent),
            borderRadius: forDropDown!
                ? BorderRadius.circular(0)
                : BorderRadius.circular(0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: forDropDown! ? 1 : 0,
                color: forDropDown!
                    ? ThemeConstants.blackcolor
                    : Colors.transparent),
            borderRadius: forDropDown!
                ? BorderRadius.circular(0)
                : BorderRadius.circular(0),
          ),
          // disabledBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(
          //       width: forDropDown! ? 0 : 0,
          //       color: forDropDown!
          //           ? ThemeConstants.blackcolor
          //           : Colors.transparent),
          //   borderRadius: forDropDown!
          //       ? BorderRadius.circular(borderRadius ?? 10)
          //       : BorderRadius.circular(0),
          // )
        ),
        validator: (value) {
          FieldValidators fieldValidator = FieldValidators();

          if (Validator.phone == validator) {
            return getPhoneNumbervalidation(value);
          } else if (Validator.email == validator) {
            return fieldValidator.getEmailvaliation(value);
          } else if (Validator.password == validator) {
            print("password");
          } else if (Validator.notEmpty == validator) {
            return getEmptyValidation(value);
          } else if (Validator.otp == validator) {
            return getOtpvalidation(value);
          } else if (Validator.plzSelectOne == validator) {
            return getEmptyDropDownValidation(value);
          } else if (Validator.cgpa == validator) {
            return getCGPAValidation(value);
          }
          else if (Validator.multiplier == validator) {
            return getMultiplierValidation(value);
          }
          else if (Validator.percentage == validator) {
            return getPercentageValidation(value);
          }else if (Validator.duolingoDefinite == validator) {
            return getDuolingoDefinite(value);
          } else {
            return null;
          }
        });
  }




}
