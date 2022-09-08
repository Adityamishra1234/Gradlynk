import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:studentpanel/utils/constants.dart';

class CustomMultiSelectDialog extends StatefulWidget {
  List<String>? data;
  String? title;
  CustomMultiSelectDialog({Key? key, this.data, this.title}) : super(key: key);

  @override
  State<CustomMultiSelectDialog> createState() =>
      _CustomMultiSelectDialogState();
}

class _CustomMultiSelectDialogState extends State<CustomMultiSelectDialog> {
  List<String>? data = [];
  String? title;
  MultiSelectItem<Object> data1 = MultiSelectItem("1", "a");
  var items;

  @override
  void initState() {
    data = widget.data!;
    title = widget.title;
    items = data!.map((data) => MultiSelectItem(data, data)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: MultiSelectDialogField(
        buttonIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.transparent,
        ),
        decoration: const BoxDecoration(color: Colors.transparent),
        separateSelectedItems: true,
        buttonText: Text(
          title!,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        title: Text(
          title!,
          style: Constants.textstyle,
        ),
        searchable: true,
        items: items,
        onConfirm: (Value) {
          // SetState()
        },
      ),
    );
  }
}
