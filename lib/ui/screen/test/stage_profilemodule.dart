import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class StageProgress extends StatelessWidget {
  const StageProgress({super.key});
  static const routeNamed = '/StageProgress';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Welcome to SIEC Gradlynk \nStudent Panel",
                    textColor: ThemeConstants.bluecolor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAutoSizeTextMontserrat(
                    text:
                        "In order to start with your application, Please follow the below steps:",
                    textColor: ThemeConstants.TextColor,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomStepper(
                text: "To Get Started, Upload Identity Proof",
                count: 1,
                last: true,
              ),
              CustomStepper(
                text: "Complete your Profile Information",
                count: 2,
              ),
              CustomStepper(
                text: "Start your Course Search",
                count: 3,
              ),
              CustomStepper(
                text: "Create your Course Shortlist",
                count: 4,
              ),
              CustomStepper(
                text: "Finalize your Application Shortlist",
                count: 5,
              ),
              CustomStepper(
                text: "Get customized Document Checklist and Upload Documents",
                count: 6,
              ),
              CustomStepper(
                text: "Track your Application Progress",
                count: 7,
              ),
              CustomStepper(
                text: "Receive Decision on your Application",
                count: 8,
              ),
              CustomStepper(
                text: "Fee Payment (SIEC facilitates Education Loan as well)",
                count: 9,
              ),
              CustomStepper(
                text: "Document preparation for Visa Application",
                count: 10,
              ),
              CustomStepper(
                text: "Visa Submission",
                count: 11,
              ),
              CustomStepper(
                text: "Decision on Visa Application",
                count: 12,
              ),
              CustomStepper(
                text: "Pre Departure - Book your Accomodation & tickets",
                count: 13,
                first: true,
              ),
            ],
          ),
        ));
  }
}

class CustomStepper extends StatelessWidget {
  bool? first;
  bool? last;
  String text;
  int count;
  CustomStepper(
      {Key? key,
      required this.text,
      required this.count,
      this.last,
      this.first})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (first == false || first == null)
          Positioned(
            top: 25,
            child: Container(
              height: 100,
              margin: const EdgeInsets.only(left: 32),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 50),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                width: 3,
                color: ThemeConstants.bluecolor,
              ))),
              // child: const Text('SubTitle\nAbc'),
            ),
          ),
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 5),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: ThemeConstants.bluecolor,
                      shape: BoxShape.circle,
                      border: Border.all(color: ThemeConstants.bluecolor)),
                  child: Center(
                    child: CustomAutoSizeTextMontserrat(
                      text: count.toString(),
                      fontSize: 16,
                      textColor: ThemeConstants.whitecolor,
                    ),
                  ),
                ),
                Container(
                  // color: ThemeConstants.GreenColor,
                  width: MediaQuery.of(context).size.width - 100,
                  child: CustomAutoSizeTextMontserrat(
                    text: text,
                    fontSize: 14,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 5),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: ThemeConstants.lightgreentColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: ThemeConstants.GreenColor, width: 0.5)),
                  child: Icon(
                    Icons.check,
                    color: ThemeConstants.GreenColor,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (last == false || last == null)
          Positioned(
            bottom: 40,
            child: Container(
              height: 20,
              margin: const EdgeInsets.only(left: 32),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                width: 3,
                color: ThemeConstants.bluecolor,
              ))),
              // child: const Text('SubTitle\nAbc'),
            ),
          ),
      ],
    );
  }
}
