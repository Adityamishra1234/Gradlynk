import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDown extends StatelessWidget {
  List<String>? model;
  bool? underline;
  // String? text;
  int? maxLines, fontSize;
  FontWeight? fontWeight;
  Color? textColor;
  final Function callbackFunction;
  String? hint;
  bool? border;
  CustomDropDown({
    Key? key,
    required this.callbackFunction,
    required this.model,
    required this.hint,
    this.border,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.textColor,
    // this.text,
    this.underline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: DropdownSearch<String>(
        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.montserrat(
            fontWeight: fontWeight ?? FontWeight.w500,
            color: textColor ?? Colors.black,
            fontSize: fontSize == null ? 16.0 : fontSize! * 1.00,
            decoration: underline != null
                ? underline == true
                    ? TextDecoration.underline
                    : TextDecoration.none
                : TextDecoration.none,
          ),
          dropdownSearchDecoration:
              border == true ? null : InputDecoration(border: InputBorder.none),
        ),
        popupProps: PopupProps.menu(
          showSearchBox: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              hint!,
            ),
          ),
        ),
        items: model!,
        onChanged: ((value) {
          callbackFunction(value);
        }),
      ),
    );
  }
}
