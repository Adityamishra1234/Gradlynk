import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CheckboxWithTextSelected extends StatefulWidget {
  final String text;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const CheckboxWithTextSelected({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CheckboxWithTextSelectedState createState() =>
      _CheckboxWithTextSelectedState();
}

class _CheckboxWithTextSelectedState extends State<CheckboxWithTextSelected> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_isSelected == true) {
            _isSelected = false;
            widget.onChanged(_isSelected);
          } else {
            _isSelected = true;
            widget.onChanged(_isSelected);
          }
        });
      },
      child: Row(
        children: [
          Checkbox(
            value: _isSelected,
            onChanged: (value) {
              setState(() {
                _isSelected = value!;
                widget.onChanged(_isSelected);
              });
            },
          ),
          SizedBox(
            child: CustomAutoSizeTextMontserrat(
              text: widget.text,
            ),
          ),
        ],
      ),
    );
  }
}
