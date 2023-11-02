import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/checkBox/multiSelected_checkBox.dart';

class CheckBoxTest extends StatefulWidget {
  CheckBoxTest({super.key});

  @override
  State<CheckBoxTest> createState() => _CheckBoxTestState();
}

class _CheckBoxTestState extends State<CheckBoxTest> {
  final List<String> items = [
    'Apples',
    'Oranges',
    'Bananas',
    "frl",
    "dsfj",
    "dfch"
  ];

  List<bool> selectedValues = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomMultiSelectedCheckbox(
            items: items,
            selectedValues: selectedValues,
            onSelectionChanged: (value) {
              setState(() {
                this.selectedValues = selectedValues;
              });

              // Do something with the selected values
              print(selectedValues);
            }),
      ),
    );
  }
}
