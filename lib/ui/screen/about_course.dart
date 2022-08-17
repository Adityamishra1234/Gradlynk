import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class AboutCourse extends StatelessWidget {
  AboutCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Country ",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Currency Code",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "USA",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "USD",
                  maxLines: 1,
                ),
              ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Capital City",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "INR value",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Washington DC",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "74.000",
                  maxLines: 1,
                ),
              ]),
            ],
          ),
        ),
        CustomAutoSizeTextMontserrat(text: "Language", maxLines: 1),
        CustomAutoSizeTextMontserrat(text: "Englidh", maxLines: 1),
        Card(
          child: Column(
            children: [
              CustomAutoSizeTextMontserrat(text: "About Country", maxLines: 1)
            ],
          ),
        ),
      ],
    ));
  }
}
