import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtons extends StatelessWidget {
  final String topic;
  final Function callbackFunction;
  const MyButtons(
      {Key? key, required this.topic, required this.callbackFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callbackFunction(topic);
      },
      child: Container(
        width: double.maxFinite,
        height: 70,
        margin: const EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 20),
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            topic,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// dropdown

class CustomDropDown extends StatelessWidget {
  List<String>? model;
  bool? underline;
  String? text;
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
    this.hint,
    this.border,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.textColor,
    this.text,
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
          dropdownSearchDecoration: border == true
              ? null
              : const InputDecoration(border: InputBorder.none),
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
