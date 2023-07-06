import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomDropDownSingleDailog extends StatefulWidget {
  bool? choosefieldtype;
  List? model;
  String? initialSelectedValue;
  final Function callbackFunction;
  CustomDropDownSingleDailog({
    Key? key,
    required this.model,
    required this.callbackFunction,
    required this.choosefieldtype,
    required this.initialSelectedValue,
  }) : super(key: key);

  @override
  _CustomDropDownSingleDailogState createState() =>
      _CustomDropDownSingleDailogState();
}

class _CustomDropDownSingleDailogState
    extends State<CustomDropDownSingleDailog> {
  String? initialSelectedValue2;
  @override
  Widget build(BuildContext context) {
    return widget.choosefieldtype == false
        ? Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 55,
              width: 300,
              decoration: BoxDecoration(
                  color: ThemeConstants.lightblueColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: SizedBox(
                width: 245,
                child: DropdownButton(
                  menuMaxHeight: 200,
                  elevation: 0,
                  underline: const SizedBox(),
                  // Initial Value
                  value: widget.initialSelectedValue,
                  alignment: AlignmentDirectional.bottomEnd,
                  // Down Arrow Icon
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: ThemeConstants.blackcolor,
                  ),
                  iconEnabledColor: ThemeConstants.whitecolor,

                  // Array list of items
                  items: widget.model!.map((dynamic items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          //Todo
                          width: 245,
                          child: CustomAutoSizeTextMontserrat(
                            text: items,
                            textColor: ThemeConstants.TextColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }).toList(),

                  onChanged: (dynamic newValue) {
                    widget.initialSelectedValue = newValue!;
                    // initialSelectedValue2 = newValue;
                    widget.callbackFunction(newValue);
                    setState(() {});
                  },
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              maxLines: 1,
              textInputAction: TextInputAction.next,
              readOnly: true,
              decoration: InputDecoration(
                hintText: widget.initialSelectedValue,
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle2,
            ),
          );
  }
}
