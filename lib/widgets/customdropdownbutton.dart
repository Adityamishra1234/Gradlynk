import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  List<String>? model;
  String? hint;
  CustomDropDown({Key? key, this.model, this.hint}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  List<String>? model;
  String? hint;
  @override
  void initState() {
    model = widget.model;
    hint = widget.hint;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: DropdownSearch<String>(
        popupProps: PopupProps.menu(
          showSearchBox: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              hint!,
            ),
          ),
        ),
        //mode of dropdown
        // mode: Mode.DIALOG,
        //to show search box
        // showSearchBox: true,
        // showSelectedItem: true,
        //list of dropdown items
        items: model!,
        //  const [
        //   "India",
        //   "USA",
        //   "Brazil",
        //   "Canada",
        //   "Australia",
        //   "Singapore"
        // ],
        // label: "Country",
        onChanged: (value) {},
        //show selected item
      ),
    );
  }
}
