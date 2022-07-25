import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  List<String>? model;
  String? hint;
  bool? border;
  CustomDropDown({Key? key, this.model, this.hint, this.border})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool? border;
  List<String>? model;
  String? hint;
  @override
  void initState() {
    border = widget.border;
    model = widget.model;
    hint = widget.hint;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: DropdownSearch<String>(
        dropdownDecoratorProps: DropDownDecoratorProps(
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
        onChanged: (value) {},
        //show selected item
      ),
    );
  }
}
