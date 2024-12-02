import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class Emptydetails extends StatelessWidget {
  const Emptydetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      // width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(82, 218, 218, 218)),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline_rounded,
              color: Color.fromARGB(255, 136, 136, 136)),
          CustomAutoSizeTextMontserrat(
              text: 'No data',
              textColor: const Color.fromARGB(255, 136, 136, 136)),
        ],
      ),
    );
  }
}
