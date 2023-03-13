import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/widgets/customgroupcheckbox.dart';

class CustomExpansiontile extends StatefulWidget {
  String? title;
  List<String>? data;
  CustomExpansiontile({Key? key, this.title, this.data}) : super(key: key);

  @override
  State<CustomExpansiontile> createState() => _CustomExpansiontileState();
}

class _CustomExpansiontileState extends State<CustomExpansiontile> {
  String? title;
  List<String>? data;

  @override
  void initState() {
    title = widget.title;
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConfigurableExpansionTile(
      borderColorEnd: Colors.transparent,
      bottomBorderOn: false,
      header: SizedBox(
        width: 220,
        height: 40,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title!,
                style: Constants.textstyle,
              ),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
      children: [
        // Check Box
        CustomgroupCheckBox(
          data: data,
        ),
      ],
    );
  }
}
