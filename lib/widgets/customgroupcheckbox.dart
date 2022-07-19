import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomgroupCheckBox extends StatefulWidget {
  List<String>? data;
  CustomgroupCheckBox({Key? key, this.data}) : super(key: key);

  @override
  State<CustomgroupCheckBox> createState() => _CustomgroupCheckBoxState();
}

class _CustomgroupCheckBoxState extends State<CustomgroupCheckBox> {
  GroupController chipsController = GroupController(isMultipleSelection: true);
  List<String>? data;

  @override
  void initState() {
    data = widget.data!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleGroupedCheckbox(
      itemsTitle: data!,
      controller: chipsController,
      values: List.generate(data!.length, (index) => index),
      onItemSelected: (values) {
        debugPrint(values.toString());
      },
    );
  }
}
