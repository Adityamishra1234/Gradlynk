import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class FieldDetail extends StatelessWidget {
  String? firstField;
  String? secondField;
  FieldDetail({Key? key, required this.firstField, required this.secondField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
          child: SizedBox(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    width: 150,
                    child: CustomAutoSizeTextMontserrat(
                      text: firstField,
                      textColor: Colors.grey,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 200,
                  // custom Text field
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomAutoSizeTextMontserrat(
                      text: secondField,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            height: 5,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
