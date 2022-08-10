import 'package:flutter/material.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';


class MultiSelectDropDown extends StatelessWidget {
  Function callbackFunction;
  String? title;
  List<dynamic>? listdata;
   MultiSelectDropDown({Key? key,this.listdata,this.title, required this.callbackFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var  items =
        listdata!.map((data) => MultiSelectItem(data, data)).toList();
    return MultiSelectDialogField(
      buttonIcon: const Icon(Icons.keyboard_arrow_down),
      decoration: const BoxDecoration(color: Colors.transparent),
      listType: MultiSelectListType.LIST,
      searchable: true,
      buttonText: Text(
        title!,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      title: Text(title!),
      items: items,
      onConfirm: (values) {
       callbackFunction(values);
      },
    );
  }
}
