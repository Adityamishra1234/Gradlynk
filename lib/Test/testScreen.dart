import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomAutoSizeTextMontserrat(text: "asd;js ,ksyad"),
      ),
    );
  }
}