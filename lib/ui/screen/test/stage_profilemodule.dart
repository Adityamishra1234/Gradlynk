import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/extensions.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:jiffy/jiffy.dart';

class StageProgress extends StatelessWidget {
  const StageProgress({super.key});
  static const routeNamed = '/StageProgress';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeConstants.whitecolor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 0,
                color: Color.fromARGB(20, 0, 0, 0))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 10, top: 20),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Your Journey Itinerary",
                textColor: ThemeConstants.bluecolor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 25),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text:
                    "An itinerary of events with estimated time span of your journey with SIEC",
                textColor: ThemeConstants.TextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomStepper(
                  iconColor: ThemeConstants.bluecolor,
                  backIconColor: ThemeConstants.lightblueColor,
                  text: "Today",
                  text2: 'Enroll With SIEC',
                  count: 1,
                  last: true,
                  icon: 'enroll',
                ),
                CustomStepper(
                  iconColor: ThemeConstants.yellow,
                  backIconColor: const Color.fromARGB(255, 255, 247, 230),
                  text: "Tomorrow",
                  text2: 'Build your Profile',
                  count: 1,
                  last: true,
                  icon: 'Build_profile',
                ),
                CustomStepper(
                  iconColor: ThemeConstants.bluecolor,
                  backIconColor: ThemeConstants.lightblueColor,
                  text:
                      "${Jiffy.now().add(days: 2).dateTime.month.monthName}  ${Jiffy.now().add(days: 2).date}",
                  text2: 'Shortlist dream course from top University',
                  count: 1,
                  last: true,
                  icon: 'Shortlist',
                ),
                CustomStepper(
                  iconColor: ThemeConstants.yellow,
                  backIconColor: const Color.fromARGB(255, 255, 247, 230),
                  text:
                      "${Jiffy.now().add(days: 5).dateTime.month.monthName}  ${Jiffy.now().add(days: 4).date}",
                  text2: 'Finalise better course with the Expert',
                  count: 1,
                  last: true,
                  icon: 'Expert',
                ),
                CustomStepper(
                  iconColor: ThemeConstants.bluecolor,
                  backIconColor: ThemeConstants.lightblueColor,
                  text:
                      "${Jiffy.now().add(days: 6).dateTime.month.monthName}  ${Jiffy.now().add(days: 6).date}",
                  text2: 'Prepare Document and initiate Application',
                  count: 1,
                  last: true,
                  icon: 'document',
                ),
                CustomStepper(
                  iconColor: ThemeConstants.yellow,
                  backIconColor: const Color.fromARGB(255, 255, 247, 230),
                  text:
                      "${Jiffy.now().add(days: 8).dateTime.month.monthName}  ${Jiffy.now().add(days: 8).date}",
                  count: 1,
                  text2: 'Submit Application',
                  last: true,
                  icon: 'submit',
                ),
                CustomStepper(
                  iconColor: ThemeConstants.bluecolor,
                  backIconColor: ThemeConstants.lightblueColor,
                  text:
                      "${Jiffy.now().add(days: 27).dateTime.month.monthName}  ${Jiffy.now().add(days: 10).date}",
                  count: 1,
                  text2: 'Receive Offer Letter',
                  last: true,
                  first: true,
                  icon: 'offer letter',
                ),
              ],
            ),
          ),
          // CustomStepper(
          //   text: "Complete your Profile Information",
          //   count: 2,
          // ),
          // CustomStepper(
          //   text: "Start your Course Search",
          //   count: 3,
          // ),
          // CustomStepper(
          //   text: "Create your Course Shortlist",
          //   count: 4,
          // ),
          // CustomStepper(
          //   text: "Finalize your Application Shortlist",
          //   count: 5,
          // ),
          // CustomStepper(
          //   text: "Get customized Document Checklist and Upload Documents",
          //   count: 6,
          // ),
          // CustomStepper(
          //   text: "Track your Application Progress",
          //   count: 7,
          // ),
        ],
      ),
    );
  }
}

class CustomStepperBox extends StatelessWidget {
  final textHead;
  final textSubHead;

  const CustomStepperBox(
      {super.key, required this.textHead, required this.textSubHead});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      width: MediaQuery.of(context).size.width * 0.5,
      height: 150,
      // alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAutoSizeTextMontserrat(
              text: "$textHead",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textalingCentre: false,
            ),
            CustomAutoSizeTextMontserrat(
              text: "$textSubHead",
              fontSize: 9,
              fontWeight: FontWeight.w500,
              textColor: ThemeConstants.TextColor,
            ),
          ]),
    );
  }
}

class CustomStepper extends StatelessWidget {
  bool? first;
  bool? last;
  String text;
  String text2;
  Color backIconColor;
  Color iconColor;

  String icon;
  int count;
  CustomStepper(
      {Key? key,
      required this.backIconColor,
      required this.iconColor,
      required this.text2,
      required this.text,
      required this.count,
      this.last,
      required this.icon,
      this.first})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        // fit: StackFit.loose,
        children: [
          if (first == false || first == null)
            Positioned(
              bottom: 5,
              left: 24,
              child: Container(
                height: 25,

                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 50),
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
            height: 75,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 0, right: 5),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: backIconColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: iconColor)),
                    child: Center(
                      child:
                       svgImage(
                              "$icon", ThemeConstants.IconColor, 23, 23),
                      //  SvgPicture.asset(
                      //   icon,
                      //   height: 23,
                      //   width: 23,
                      //   color: iconColor,
                      //   //   ), ,
                      // ),
                    ),
                  ),
                  CustomStepperBox(textHead: text, textSubHead: text2),
                  // Container(
                  //   // color: ThemeConstants.GreenColor,
                  //   width: MediaQuery.of(context).size.width - 100,
                  //   child: CustomAutoSizeTextMontserrat(
                  //     text: text,
                  //     fontSize: 14,
                  //   ),
                  // ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
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
      ),
    );
  }
}
