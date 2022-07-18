import 'package:flutter/src/widgets/framework.dart';
import 'package:multiselect/multiselect.dart';

class MultiSelectDropDown extends StatefulWidget {
  String? title;
  List<String>? listdata;
  MultiSelectDropDown({Key? key, this.title, this.listdata}) : super(key: key);

  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  String? title;
  List<String>? listdata;
  @override
  void initState() {
    super.initState();
    title = widget.title;
    listdata = widget.listdata;
  }

  List<String> selected = [];
  @override
  Widget build(BuildContext context) {
    return DropDownMultiSelect(
      onChanged: (List<String> x) {
        setState(() {
          selected = x;
        });
      },
      options: listdata!,
      selectedValues: selected,
      whenEmpty: title,
    );
  }
}
