import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customgroupcheckbox.dart';

class Filter extends StatefulWidget {
  CourseModelFilter courseModelFilter = CourseModelFilter();
  Filter({Key? key, required this.courseModelFilter}) : super(key: key);
  static const routeNamed = '/Filter';

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  CourseModelFilter courseModelFilter = CourseModelFilter();
  int choosefilter = 0;
  @override
  void initState() {
    // TODO: implement initState
    courseModelFilter = widget.courseModelFilter;
    super.initState();
  }

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
                                onPressed: () {
                                  choosefilter = 0;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 1;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 2;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 3;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 4;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 5;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 6;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 17;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 7;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 8;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 9;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 10;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 11;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 12;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 13;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 14;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 15;
                                  setState(() {});
                                },
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
                                onPressed: () {
                                  choosefilter = 16;
                                  setState(() {});
                                },
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
                      child: getFilterOption(choosefilter)),
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

  // Function
  Widget getFilterOption(int i) {
    return ListView(
      children: [
        if (i == 1)
          CustomgroupCheckBox(
            data: courseModelFilter.filterModel.universityname,
          ),

        // Institute -Public/Private
        if (i == 17)
          CustomgroupCheckBox(
            data: ["Public", "Private"],
          ),

//Scholarship
        if (i == 8)
          CustomgroupCheckBox(
            data: ["Yes", "No"],
          ),
        //Siec Priority
        if (i == 9)
          CustomgroupCheckBox(
            data: ["Yes", "No"],
          ),
        //backlog acceptable
        if (i == 11)
          CustomgroupCheckBox(
            data: ["Yes", "No"],
          ),
        //Application Fee
        if (i == 12)
          CustomgroupCheckBox(
            data: ["Yes", "No"],
          ),
        //Placement/Sandwich Years
        if (i == 15)
          CustomgroupCheckBox(
            data: ["Yes", "No"],
          ),
        //SIEC Represented
        if (i == 16)
          CustomgroupCheckBox(
            data: ["Yes", "No"],
          ),
      ],
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
