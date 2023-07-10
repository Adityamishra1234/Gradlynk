import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:studentpanel/utils/theme.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: ThemeConstants.lightOrangeColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: SizedBox(
            height: 60,
            child: PinCodeFields(
              length: 6,
              obscureText: true,
              obscureCharacter: "*",
              onComplete: (String value) {},
            ),
          ),
        ),
      ),
    );
  }
}
