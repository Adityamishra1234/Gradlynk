import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class StepsToVisa extends StatelessWidget {
  const StepsToVisa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        CustomAutoSizeTextMontserrat(text: "Visa Fee", maxLines: 1),
        CustomAutoSizeTextMontserrat(
            text: "160.00 USD (In INR : 11840)", maxLines: 1),
        CustomAutoSizeTextMontserrat(text: "Steps to Visa", maxLines: 1),
      ],
    ));
  }
}
