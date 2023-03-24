import 'package:flutter/material.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:studentpanel/utils/theme.dart';

class CustomDropDown extends StatefulWidget {
  Function callbackFunction;
  String? title;
  List<dynamic>? listdata;
  CustomDropDown(
      {Key? key, this.listdata, this.title, required this.callbackFunction})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool resize = false;
  @override
  Widget build(BuildContext context) {
    var items =
        widget.listdata!.map((data) => MultiSelectItem(data, data)).toList();
    return MultiSelectDialogField(
      onSelectionChanged: (p0) {
        if (p0.isEmpty) {
          resize = false;
        } else {
          resize = true;
        }
        print(p0.length);
      },
      chipDisplay: MultiSelectChipDisplay(
        // onTap: ((p0) {

        // }),

        textStyle: ThemeConstants.montserrattextstyle3,
        chipColor: ThemeConstants.lightblueColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      dialogHeight: 180,
      buttonIcon: const Icon(Icons.keyboard_arrow_down),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      listType: MultiSelectListType.LIST,
      searchable: true,
      buttonText: Text(
        widget.title!,
        style: ThemeConstants.getTextStyle(resize),
        // style: TextStyle(
        //     fontSize: resize == false ? 18 : 12,
        //     fontWeight: FontWeight.w500,
        //     fontFamily: "Montserra"),
      ),
      title: Text(widget.title!),
      items: items,
      onConfirm: (values) {
        widget.callbackFunction(values);
      },
    );
  }
}
