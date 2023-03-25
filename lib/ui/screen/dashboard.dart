import 'dart:async';

import 'package:bulleted_list/bulleted_list.dart';
import 'package:coachmaker/coachmaker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationsummary.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch.dart';
import 'package:studentpanel/ui/screen/dashboard/bookanappointment.dart';
import 'package:studentpanel/ui/screen/dashboard/scheduleExpertCall.dart';
import 'package:studentpanel/ui/screen/dashboard/upcomingevent.dart';
import 'package:studentpanel/ui/screen/test/downloadtestfile.dart';
import 'package:studentpanel/ui/screen/test/uploadfile.dart';
import 'package:studentpanel/ui/screen/track_application/trackapllication.dart';
import 'package:studentpanel/ui/screen/updatedialog.dart';
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

  final _key1 = GlobalKey();
  final _key2 = GlobalKey();
  final _key3 = GlobalKey();
  final _key4 = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _key1.currentState!.dispose();
    _key2.currentState!.dispose();
    _key3.currentState!.dispose();
    _key4.currentState!.dispose();
    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }

  getintro(BuildContext context) {
    CoachMaker(
      context,
      // firstDelay: Duration(seconds: 10),
      // duration: Duration(milliseconds: 600),
      initialList: [
        CoachModel(
          initial: '1',
          title: 'Keong Racun',
          maxWidth: 400,
          subtitle: [
            'Dasar kau keong racun\nBaru kenal eh ngajak tidur\nNgomong nggak sopan santun\nKau anggap aku ayam kampung',
          ],
          header: Image.network(
            'https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512',
            height: 50,
            width: 50,
          ),
        ),
        CoachModel(
            initial: '2',
            title: 'Burung Bangau yang Angkuh',
            maxWidth: 400,
            alignment: Alignment.centerRight,
            subtitle: [
              'Seekor bangau berjalan dengan langkah yang anggun di sepanjang sebuah sungai kecil, matanya menatap air sungai yang jernih, leher dan paruhnya yang panjang siap untuk menangkap mangsa di air sebagai sarapan paginya. Saat itu, sungai dipenuhi dengan ikan-ikan yang berenang, tetapi sang Bangau merasa sedikit angkuh di pagi hari itu.',
              'bagian 2'
            ],
            header: Image.network(
              'https://lh3.googleusercontent.com/3_OFn2skqHXk-UQ-9RUdNrDl_HQJrMCxks5teQcUrF_bOSeDG1hD8j83FeD31W8hASZCvubzsGfumuJq8kvvSAq03wY87RZ7Otx_DF4',
              height: 50,
              width: 50,
            )),
        CoachModel(
            initial: '3',
            title: 'Burung perkutut, burung kuthilang',
            maxWidth: 400,
            alignment: Alignment.centerRight,
            subtitle: [
              'kamu kentut enggak bilang bilang ',
            ],
            header: Image.network(
              'https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA',
              height: 50,
              width: 50,
            )),
        CoachModel(
            initial: '4',
            title: 'Balonku ada lima',
            maxWidth: 400,
            alignment: Alignment.center,
            subtitle: [
              'Rupa-rupa warnanya\nHijau, kuning, kelabu\n\nMerah muda dan biru\nMeletus balon hijau DOR!',
            ],
            header: Image.asset(
              'images/logo.png',
              height: 50,
              width: 50,
            )),
      ],
      nextStep: CoachMakerControl.next,
      skip: () {},
      // customNavigator: (onSkip, onNext) {
      //   return Row(
      //     children: [
      //       IconButton(
      //         onPressed: () {
      //           onSkip!();
      //         },
      //         icon: Icon(Icons.close),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           onNext();
      //         },
      //         icon: Icon(Icons.arrow_forward),
      //       )
      //     ],
      //   );
      // },
      buttonOptions: CoachButtonOptions(
        skipTitle: 'Lewati',
        buttonTitle: 'Lanjut',
        buttonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return GetBuilder<BaseController>(builder: (_) {
      return Scaffold(
        appBar: controller.loadingStudentPanelData1.value == true
            ? CustomAppBar("DashBoard")
            : null,
        drawer: displayMobileLayout == false
            ? CustomDrawer(
                index: 0,
              )
            : null,
        body:
            // setState(() {});
            _.loadingStudentPanelData1.value == true
                ? Row(
                    children: [
                      if (displayMobileLayout == true)
                        CustomDrawer(
                          index: 0,
                        ),
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
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CoachPoint(
                                            initial: '1',
                                            child: InkWell(
                                              onTap: () {
                                                // getDailogForAgree(context);
                                                getintro(context);
                                              },
                                              child: Text(
                                                "Hi,",
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                    textStyle:
                                                        const TextStyle()),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              height: 50,
                                              child:
                                                  CustomAutoSizeTextMontserrat(
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
                                  CoachPoint(
                                    initial: '2',
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor:
                                            ThemeConstants.whitecolor,
                                        elevation: 0,
                                        backgroundColor:
                                            ThemeConstants.whitecolor,
                                        shadowColor:
                                            ThemeConstants.lightblueColor,
                                        side: BorderSide(
                                            color: ThemeConstants
                                                .bluecolor), // foreground
                                      ),
                                      onPressed: () {
                                        Get.toNamed(
                                            ScheduleExpertCall.routeNamed);
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Schedule expert call",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        textColor: ThemeConstants.bluecolor,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  CoachPoint(
                                    initial: '3',
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor:
                                            ThemeConstants.whitecolor,
                                        elevation: 0,
                                        backgroundColor:
                                            ThemeConstants.whitecolor,
                                        shadowColor:
                                            ThemeConstants.lightorangeColor,
                                        side: BorderSide(
                                            color: ThemeConstants
                                                .orangeColor), // foreground
                                      ),
                                      onPressed: () {
                                        Get.toNamed(
                                            BookAnAppointment.routeNamed);
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Book an appointment",
                                        fontSize: 12,
                                        textColor: ThemeConstants.orangeColor,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                  CoachPoint(
                                    initial: '4',
                                    child: InkWell(
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
                                                      color: const Color(
                                                          0xFFF1F0FF)),
                                                  color:
                                                      const Color(0xFFF1F0FF),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: svgImage(
                                                  "create_profile",
                                                  const Color(0xFF6F61FF),
                                                  80,
                                                  80)),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              "Create your profile",
                                              style: _textStyle,
                                            ),
                                          )
                                        ],
                                      ),
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
                                                      color: const Color(
                                                          0xFFFEF6E6)),
                                                  color:
                                                      const Color(0xFFFEF6E6),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: svgImage(
                                                  "upload_document",
                                                  const Color(0xFFF8A300),
                                                  80,
                                                  80)),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
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
                                                    color: const Color(
                                                        0xFFFEF0F0)),
                                                color: const Color(0xFFFEF0F0),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20))),
                                            child: svgImage(
                                                "course",
                                                const Color(0xFFF16660),
                                                80,
                                                80)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
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
                                      Get.toNamed(
                                          ApplicationSummary.routeNamed);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 130,
                                          width: 160,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0,
                                                  color:
                                                      const Color(0xFFE8FAFD)),
                                              color: const Color(0xFFE8FAFD),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(30.0),
                                            child: svgImage(
                                                "track",
                                                const Color(0xFF05B4D2),
                                                80,
                                                80),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
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
                                              color: Color(0xFFE5E1FE),
                                              width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: SizedBox(
                                                      width: 50,
                                                      child: svgImage(
                                                          "calender",
                                                          const Color(
                                                              0xFF6F61FF),
                                                          70,
                                                          60)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: SizedBox(
                                                    width:
                                                        displayMobileLayout ==
                                                                true
                                                            ? (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    240) *
                                                                0.70
                                                            : MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.70,
                                                    child: Column(
                                                      children: [
                                                        BulletedList(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          bullet:
                                                              const MyBullet(),
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
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.70,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 38),
                                                            child: Text(_
                                                                .upcomingModel![
                                                                    0]
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
                                                                model: _
                                                                    .upcomingModel,
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
                  ),
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
    });
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
