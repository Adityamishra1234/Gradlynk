import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/multiselectdropdown.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);
  static const routeNamed = '/Filter';

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: Column(
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            color: ThemeConstants.lightorangeColor,
            child: Row(
              children: [
                const Spacer(),
                CustomAutoSizeTextMontserrat(
                  text: "Filter",
                  textColor: ThemeConstants.orangeColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  "assets/icons/filter.svg",
                  color: ThemeConstants.orangeColor,
                  height: 14,
                ),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 220,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    color: ThemeConstants.whitecolor,
                    child: ListView(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "University Name",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Intake Month",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Intake Year",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Academic %",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Budget",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Country Name",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Select Ranking",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 60,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Institute -public/private",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Institute Level",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Scholarship",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "SIEC Priority",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Conditional Offer",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Backlog Acceptabe",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Application Fee",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Offer TAT(In days)",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Visa TAT(In days)",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 60,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Placement/Sandwich year",
                                )),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: CustomAutoSizeTextMontserrat(
                                  text: "SIEC Represented",
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height - 220,
                    child: const VerticalDivider()),
                Padding(
                  padding: const EdgeInsets.only(right: 9),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height - 220,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      child: MultiSelectDropDown(
                        callbackFunction: () {},
                        listdata: ["choose 1", "choose 2", "choose 3"],
                        title: "Test",
                      )),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            color: ThemeConstants.whitecolor,
            child: Row(
              children: [
                const Spacer(),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            ThemeConstants.whitecolor),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ThemeConstants.whitecolor),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(
                                    color: ThemeConstants.TextColor)))),
                    onPressed: () {},
                    child: CustomAutoSizeTextMontserrat(
                      text: "Clear Filter ",
                      fontWeight: FontWeight.bold,
                      textColor: ThemeConstants.TextColor,
                    )),
                const Spacer(),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            ThemeConstants.bluecolor),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ThemeConstants.bluecolor),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(
                                    color: ThemeConstants.bluecolor)))),
                    onPressed: () {},
                    child: CustomAutoSizeTextMontserrat(
                      text: "Apply  Filter ",
                      fontWeight: FontWeight.bold,
                      textColor: ThemeConstants.whitecolor,
                    )),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 1.0,
      color: ThemeConstants.lightgreycolor,
    );
  }
}
