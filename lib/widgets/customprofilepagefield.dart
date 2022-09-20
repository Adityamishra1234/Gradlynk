import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';

class CustomProfilePageField extends StatelessWidget {
  bool? readonly = false;
  String? hintext;
  Function callbackFunction;
  int? maxlines;

  CustomProfilePageField(
      {Key? key,
      required this.hintext,
      this.readonly,
      this.maxlines,
      required this.callbackFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        maxLines: maxlines ?? 1,
        textInputAction: TextInputAction.next,
        readOnly: readonly!,
        decoration: InputDecoration(
          hintText: hintext,
          filled: true,
          fillColor: ThemeConstants.lightblueColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        style: ThemeConstants.montserrattextstyle,
      ),
    );
  }
}
