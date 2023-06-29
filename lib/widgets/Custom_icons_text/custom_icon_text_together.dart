import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomIconTextTogether extends StatelessWidget {
  final Icon iconData;
  final String text;
  const CustomIconTextTogether(
      {super.key, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1)),
      child: Row(
        children: [
          iconData,
          SizedBox(
            width: 5,
          ),
          CustomAutoSizeTextMontserrat(
            text: '$text',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
