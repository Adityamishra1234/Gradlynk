import 'package:bulleted_list/bulleted_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationsummary.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch.dart';
import 'package:studentpanel/ui/screen/dashboard/upcomingevent.dart';
import 'package:studentpanel/ui/screen/test/downloadtestfile.dart';
import 'package:studentpanel/ui/screen/test/uploadfile.dart';
import 'package:studentpanel/ui/screen/track_application/trackapllication.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/bottomnavigation.dart';
import 'package:studentpanel/widgets/customautosizetext.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/test.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);
  static const routeNamed = '/DashBoard';

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var controller = Get.put(BaseController(), permanent: true);
  var dashboardController = Get.put(DashboardController());
  final TextStyle _textStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w800,
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return Scaffold(
      appBar: CustomAppBar("DashBoard"),
      drawer: displayMobileLayout == false ? const CustomDrawer() : null,
      body: GetBuilder<BaseController>(builder: (_) {
        return _.loadingStudentPanelData1.value == true
            ? Row(
                children: [
                  if (displayMobileLayout == true) const CustomDrawer(),
                  Container(
                    color: Colors.white,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: displayMobileLayout == true
                          ? MediaQuery.of(context).size.width - 240
                          : MediaQuery.of(context).size.width,
                      child: ListView(
                        controller: ScrollController(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              height: 105,
                              width: displayMobileLayout == true
                                  ? MediaQuery.of(context).size.width - 240
                                  : MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text(
                                        "Hi,",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            textStyle: const TextStyle()),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          height: 50,
                                          child: CustomAutoSizeTextMontserrat(
                                            text: firstLetterChaptial(_
                                                    .personalModal
                                                    .enquiryName) ??
                                                firstLetterChaptial(
                                                    _.model1.enquiryName),
                                            maxLines: 2,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    indent: 30,
                                    endIndent: 30,
                                    color: Color(0xFFD6D6D6),
                                  )
                                ],
                              ),
                            ),
                          ),

                          // Schedule Expert Call Button And Book an Appointment
                          Row(
                            children: [
                              // const SizedBox(
                              //   width: 20,
                              // ),
                              const Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: ThemeConstants.whitecolor,
                                  elevation: 0,
                                  backgroundColor: ThemeConstants.whitecolor,
                                  shadowColor: ThemeConstants.lightblueColor,
                                  side: BorderSide(
                                      color: ThemeConstants
                                          .bluecolor), // foreground
                                ),
                                onPressed: () async {
                                  Get.bottomSheet(Container(
                                    height: 345,
                                    decoration: BoxDecoration(
                                      color: ThemeConstants.whitecolor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(15.0),
                                          topLeft: Radius.circular(15.0)),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Container(
                                            height: 50,
                                            width: displayMobileLayout == true
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    240
                                                : MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            decoration: BoxDecoration(
                                                color: ThemeConstants
                                                    .lightblueColor,
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(10.0)),
                                            child: Center(
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Schedule an Expert call",
                                                textColor:
                                                    ThemeConstants.bluecolor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Select your Counsellor",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: CustomDropDown(
                                              border: true,
                                              hint: "Select your Counsellor",
                                              callbackFunction:
                                                  callbackDropDownButton,
                                              model: const ["1", "2", "3"]),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                                text: "Select your Counsellor"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: CustomDropDown(
                                              border: true,
                                              hint: "Select your Counsellor",
                                              callbackFunction:
                                                  callbackDropDownButton,
                                              model: const ["1", "2", "3"]),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                                text: "Select your Counsellor"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: CustomDropDown(
                                              border: true,
                                              hint: "Select your Counsellor",
                                              callbackFunction:
                                                  callbackDropDownButton,
                                              model: const ["1", "2", "3"]),
                                        ),
                                      ],
                                    ),
                                  ));
                                },
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Schedule expert call",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  textColor: ThemeConstants.bluecolor,
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: ThemeConstants.whitecolor,
                                  elevation: 0,
                                  backgroundColor: ThemeConstants.whitecolor,
                                  shadowColor: ThemeConstants.lightorangeColor,
                                  side: BorderSide(
                                      color: ThemeConstants
                                          .orangeColor), // foreground
                                ),
                                onPressed: () async {
                                  Get.bottomSheet(Container(
                                    height: 340,
                                    decoration: BoxDecoration(
                                      color: ThemeConstants.whitecolor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(15.0),
                                          topLeft: Radius.circular(15.0)),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Container(
                                            height: 40,
                                            width: displayMobileLayout == true
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    240
                                                : MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            decoration: BoxDecoration(
                                                color: ThemeConstants
                                                    .lightblueColor,
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(10.0)),
                                            child: Center(
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Book an appointment",
                                                textColor:
                                                    ThemeConstants.bluecolor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                                text: "Book an appointment"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: CustomDropDown(
                                              border: true,
                                              hint: "Select your Counsellor",
                                              callbackFunction:
                                                  callbackDropDownButton,
                                              model: const ["1", "2", "3"]),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                                text: "Select your Counsellor"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: CustomDropDown(
                                              border: true,
                                              hint: "Select your Counsellor",
                                              callbackFunction:
                                                  callbackDropDownButton,
                                              model: const ["1", "2", "3"]),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                                text: "Select your Counsellor"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: CustomDropDown(
                                              border: true,
                                              hint: "Select your Counsellor",
                                              callbackFunction:
                                                  callbackDropDownButton,
                                              model: const ["1", "2", "3"]),
                                        ),
                                      ],
                                    ),
                                  ));
                                },
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Book an appointment",
                                  fontSize: 12,
                                  textColor: ThemeConstants.orangeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // const SizedBox(
                              //   width: 20,
                              // ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Wrap(
                            runSpacing: 15.0,
                            spacing: 15.0,
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              // Create profile
                              InkWell(
                                onTap: () async {
                                  // final cameras = await availableCameras();

                                  // // Get a specific camera from the list of available cameras.
                                  // final firstCamera = cameras.first;
                                  // // String id = DateTime.now().toIso8601String();
                                  // Get.to(TakePictureScreen(
                                  //   camera: firstCamera,
                                  // ));

                                  Get.toNamed(ProfilePageCopy.routeNamed);
                                  // Get.to(DownloadFileTest());
                                  // Get.to(CustomFileUpload());
                                  // getDashboardScreen(context, callbackDropDownButton);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        height: 130,
                                        width: 160,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0,
                                                color: const Color(0xFFF1F0FF)),
                                            color: const Color(0xFFF1F0FF),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20))),
                                        child: svgImage("create_profile",
                                            const Color(0xFF6F61FF), 80, 80)),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Create your profile",
                                        style: _textStyle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //Upload Document
                              InkWell(
                                onTap: () {
                                  Get.toNamed(UploadDocument.routeNamed);
                                },
                                child: Ink(
                                  height: 160,
                                  width: 160,
                                  color: Colors.amber,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 130,
                                          width: 160,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0,
                                                  color:
                                                      const Color(0xFFFEF6E6)),
                                              color: const Color(0xFFFEF6E6),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20))),
                                          child: svgImage("upload_document",
                                              const Color(0xFFF8A300), 80, 80)),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Upload document",
                                          style: _textStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //Course Search
                              InkWell(
                                onTap: () {
                                  Get.toNamed(CourseSearch.routeNamed);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        height: 130,
                                        width: 160,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0,
                                                color: const Color(0xFFFEF0F0)),
                                            color: const Color(0xFFFEF0F0),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20))),
                                        child: svgImage("course",
                                            const Color(0xFFF16660), 80, 80)),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Course Search",
                                        style: _textStyle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Track Application
                              InkWell(
                                onTap: () {
                                  Get.toNamed(ApplicationSummary.routeNamed);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0,
                                              color: const Color(0xFFE8FAFD)),
                                          color: const Color(0xFFE8FAFD),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: svgImage("track",
                                            const Color(0xFF05B4D2), 80, 80),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Track application",
                                        style: _textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Upcoming Event
                          if (_.loadingUpcomingEvents.value == true)
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                              ),
                              child: Container(
                                  // width: displayMobileLayout == true
                                  //     ? MediaQuery.of(context).size.width - 240
                                  //     : MediaQuery.of(context).size.width * 0.90,
                                  constraints:
                                      const BoxConstraints(maxWidth: 300),
                                  child: Card(
                                    elevation: 0.7,
                                    shadowColor: const Color(0xFFE5E1FE),
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Color(0xFFE5E1FE), width: 1.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 35),
                                          child: Text(
                                            "Upcoming Event",
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 26,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: SizedBox(
                                                  width: 50,
                                                  child: svgImage(
                                                      "calender",
                                                      const Color(0xFF6F61FF),
                                                      70,
                                                      60)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: SizedBox(
                                                width: displayMobileLayout ==
                                                        true
                                                    ? (MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            240) *
                                                        0.70
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.70,
                                                child: Column(
                                                  children: [
                                                    BulletedList(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      bullet: const MyBullet(),
                                                      listItems: [
                                                        CustomAutoSizeText(
                                                            text: _
                                                                .upcomingModel![
                                                                    0]
                                                                .campaignName,
                                                            maxLines: 3),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.70,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 38),
                                                        child: Text(_
                                                            .upcomingModel![0]
                                                            .campaignDate!),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UpcomingEvent(
                                                            model:
                                                                _.upcomingModel,
                                                          )));

                                              // Get.snackbar(
                                              //   "DashBoard",
                                              //   "View All",
                                              //   snackPosition:
                                              //       SnackPosition.BOTTOM,
                                              // );
                                            },
                                            child: const Text("View all"))
                                      ],
                                    ),
                                  )),
                            ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: getLoading(context),
              );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 10),
        child: FloatingActionButton.extended(
          tooltip: "SVO",
          backgroundColor: ThemeConstants.bluecolor,
          onPressed: () async {
            // SVO Join Code
            await _launchURL();
            // isExtended: true,
          },
          icon: svgImage("video-call", ThemeConstants.whitecolor, 40, 30),
          label: CustomAutoSizeTextMontserrat(
            text: "Join SVO",
            textColor: ThemeConstants.whitecolor,
          ),
        ),
      ),
      // FloatingActionButton.extended(
      //   backgroundColor: Colors.green,
      //   foregroundColor: Colors.black,
      //   onPressed: () {
      //     // Respond to button press
      //   },
      //   icon: Icon(Icons.add),
      //   label: Text('Floating Action Button'),
      // ),
      // floatingActionButtonLocation:
      //     showFab ? FloatingActionButtonLocation.miniCenterDocked : null,
      // floatingActionButton: Visibility(
      //   visible: showFab,
      //   child: FloatingActionButton(
      //       tooltip: "SVO",
      //       backgroundColor: ThemeConstants.bluecolor,
      //       onPressed: () async {
      //         // SVO Join Code
      //         await _launchURL();
      //         // isExtended: true,
      //       },
      //       child: svgImage("video-call", ThemeConstants.whitecolor, 40, 30)),
      // ),
      // bottomNavigationBar: BottomNavigation(
      //   index: 0,
      // ),
    );
  }

  callbackDropDownButton(varTopic) {}

  _launchURL() async {
    const url =
        'https://zoom.us/j/97485138279?pwd=Y1cwcXRHUWZWOFN3aTZOdmhHZm4yQT09';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class MyBullet extends StatelessWidget {
  const MyBullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 7,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
