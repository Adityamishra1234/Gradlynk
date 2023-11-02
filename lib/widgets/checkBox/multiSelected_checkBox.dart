import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/checkBox/checkBox.dart';

class CustomMultiSelectedCheckbox extends StatefulWidget {
  final List<dynamic> items;
  final List<bool> selectedValues;
  final ValueChanged<List<bool>> onSelectionChanged;

  const CustomMultiSelectedCheckbox({
    Key? key,
    required this.items,
    required this.selectedValues,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _CustomMultiSelectedCheckboxState createState() =>
      _CustomMultiSelectedCheckboxState();
}

class _CustomMultiSelectedCheckboxState
    extends State<CustomMultiSelectedCheckbox> {
  late List<bool> _selectedValues;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 50,
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.items.asMap().entries.map((entry) {
          int index = entry.key;
          String item = entry.value;
          return CheckboxWithTextSelected(
            onChanged: (value) {
              setState(() {
                widget.selectedValues[index] = value;
                widget.onSelectionChanged(widget.selectedValues);
              });
            },
            isSelected: widget.selectedValues[index],
            text: item,
          );
        }).toList(),
      ),
    );
  }
}
