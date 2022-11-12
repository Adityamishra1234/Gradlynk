import 'package:flutter/material.dart';
import 'package:studentpanel/ui/models/checkbox.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class MultiSelectionExample extends StatefulWidget {
  List<CheckBoxModel> checkBoxModel;
  Function? callbackItemSelected;
  String? indexSelected;

  MultiSelectionExample(
      {Key? key,
      required this.checkBoxModel,
      required this.callbackItemSelected,
      this.indexSelected})
      : super(key: key);

  @override
  _MultiSelectionExampleState createState() => _MultiSelectionExampleState();
}

class _MultiSelectionExampleState extends State<MultiSelectionExample> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 220,
      width: MediaQuery.of(context).size.width / 2 - 10,
      child: ListView.builder(
        controller: ScrollController(),
        itemBuilder: (ctx, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              widget.checkBoxModel[index].isSelected =
                  !widget.checkBoxModel[index].isSelected;

              String? selecteditems = widget.indexSelected;
              // widget.checkBoxModel[index].isSelected =
              //     !widget.checkBoxModel[index].isSelected;

              for (var i = 0; i < widget.checkBoxModel.length; i++) {
                if (widget.checkBoxModel[i].isSelected == true) {
                  selecteditems =
                      "${selecteditems!},${widget.checkBoxModel[i].checkBoxModelName}";
                }
              }
              widget.callbackItemSelected!(selecteditems);

              setState(() {});
            },
            child: Container(
              color: widget.checkBoxModel[index].isSelected
                  ? ThemeConstants.lightblueColor
                  : null,
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: widget.checkBoxModel[index].isSelected,
                      onChanged: (s) {}),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 60,
                    child: CustomAutoSizeTextMontserrat(
                        text: widget.checkBoxModel[index].checkBoxModelName),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: widget.checkBoxModel.length,
      ),
    );
  }
}
