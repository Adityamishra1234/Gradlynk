import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/utils/theme.dart';

class CustomDropDownProfilePage extends StatelessWidget {
  bool? searchBox;
  bool? choosefieldtype;
  List<String>? model;
  bool? underline;
  String? text;
  int? maxLines, fontSize;
  FontWeight? fontWeight;
  Color? textColor;
  final Function callbackFunction;
  String? hint;
  bool? border;
  CustomDropDownProfilePage({
    Key? key,
    this.text,
    this.searchBox,
    required this.callbackFunction,
    required this.model,
    required this.hint,
    required this.choosefieldtype,
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            if (choosefieldtype == false)
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: ThemeConstants.lightblueColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                child: DropdownSearch<String>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: GoogleFonts.montserrat(
                      decorationColor: ThemeConstants.lightblueColor,
                      backgroundColor: ThemeConstants.lightblueColor,
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
                    showSearchBox: searchBox ?? true,
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
              ),
            if (choosefieldtype == true)
              Padding(
                padding: const EdgeInsets.only(),
                child: TextField(
                  maxLines: 1,
                  textInputAction: TextInputAction.next,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: text!,
                    filled: true,
                    fillColor: ThemeConstants.lightblueColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  style: ThemeConstants.montserrattextstyle,
                ),
              )
          ],
        ),
      ),
    );
  }
}
