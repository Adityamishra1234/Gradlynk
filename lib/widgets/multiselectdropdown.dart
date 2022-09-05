import 'package:flutter/material.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class MultiSelectDropDown extends StatefulWidget {
  Function callbackFunction;
  String? title;
  List<dynamic>? listdata;
  MultiSelectDropDown(
      {Key? key, this.listdata, this.title, required this.callbackFunction})
      : super(key: key);

  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  bool resize = false;
  @override
  Widget build(BuildContext context) {
    var items =
        widget.listdata!.map((data) => MultiSelectItem(data, data)).toList();
    return MultiSelectDialogField(
      dialogHeight: 180,
      buttonIcon: const Icon(Icons.keyboard_arrow_down),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      listType: MultiSelectListType.LIST,
      searchable: true,
      buttonText: Text(
        widget.title!,
        style: TextStyle(
            fontSize: resize == false ? 18 : 12,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserra"),
      ),
      title: Text(widget.title!),
      items: items,
      onConfirm: (values) {
        widget.callbackFunction(values);
        setState(() {
          resize = true;
        });
      },
    );
  }
}
