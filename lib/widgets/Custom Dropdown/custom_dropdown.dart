import 'package:flutter/material.dart';
import 'package:studentpanel/utils/config/size_config.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/customizable_dropdown.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomDropDownSingle extends StatelessWidget {
  bool? choosefieldtype;
  List model;
  String? initialSelectedValue;
  final Function callbackFunction;
  Color? bgColor;
  FontWeight? fontWeight;
  CustomDropDownSingle({
    Key? key,
    this.bgColor,
    required this.model,
    this.fontWeight,
    required this.callbackFunction,
    required this.choosefieldtype,
    required this.initialSelectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(initialSelectedValue);
    return choosefieldtype == true
        ? Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: ThemeConstants.lightblueColor,
                  // border: Border.all(color: ThemeConstants.bluecolor),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomAutoSizeTextMontserrat(
                  textColor: ThemeConstants.TextColor,
                  fontSize: SizeConfig.fontLabelSize,
                  fontWeight: SizeConfig.fontLabelWeight,
                  text: initialSelectedValue,
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: CustomizableDropdown(
                selectedItem: initialSelectedValue,
                maxHeight: 150,
                height: 50,
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                ),
                titleAlign: TextAlign.center,
                decoration: BoxDecoration(
                  color:
                      bgColor == null ? ThemeConstants.lightblueColor : bgColor,
                  // border: Border.all(color: ThemeConstants.bluecolor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                itemList: model,
                onSelectedItem: (sele) {
                  callbackFunction(sele);
                },
                placeholder: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: CustomAutoSizeTextMontserrat(
                        text: initialSelectedValue))),
          );
  }
}
