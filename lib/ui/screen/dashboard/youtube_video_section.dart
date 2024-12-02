import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/screen/dashboard/models/youtubevideoModel.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetext.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/youtube/customyoutube.dart';

import '../../../widgets/drawerfilter.dart';
import '../../controllers/basecontroller.dart';
import '../../controllers/dashboardcontroller.dart';
import '../mark_attendance/qrCodeScreen.dart';
var dashboardController = Get.put(DashboardController());
class YoutubeVideoSection extends StatelessWidget {
  List<YoutubeVideoModel> youtubeVideoModel = [];
  bool isLoading;
  YoutubeVideoSection(
      {Key? key, required this.youtubeVideoModel, required this.isLoading})
      : super(key: key);
  // List link;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 190,
      child: isLoading == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10, bottom: 8),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hear it from our students",
                          maxLines: 2,
                          style:  GoogleFonts.abhayaLibre(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff414040),
                            ),
                          )
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return  AllYoutubeVideoSection(
                              youtubeVideoModel:
                              dashboardController
                                  .youtubeVideoModel,
                              isLoading: dashboardController
                                  .youtubeVideoLoading,
                            );
                          }));
                        },
                        child: Text("See all",
                            maxLines: 2,
                            style:  GoogleFonts.abhayaLibre(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeConstants.bluecolor
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: youtubeVideoModel.length,
                          itemBuilder: (context, index) {
                            // var YtId = link[index]
                            //     .toString()
                            //     .substring(32, link[index].toString().length);
                            return Container(
                                width: 310,
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightblueColor,
                                    // gradient: LinearGradient(
                                    //     colors: [Color(0xFF3E66DD), Color(0xFF6554CF)]),
                                    // color: ThemeConstants.GreenColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: -0.2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 4),
                                      )],
                                    // border: Border.all(
                                    //     width: 0.8,
                                    //     color: ThemeConstants.bluecolor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  child: StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    bool videoPlay = false;
                                    if (videoPlay == true) {
                                      return SizedBox(
                                        width: 280,
                                        child: YouTubeVideoPlayer(
                                          videoUrl:
                                              youtubeVideoModel[index].video ??
                                                  "",
                                        ),
                                      );
                                    } else {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(YouTubeVideoPlayer(
                                            videoUrl: youtubeVideoModel[index]
                                                    .video ??
                                                "",
                                          ));
                                        },
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Image.network(
                                              youtubeVideoModel[index]
                                                      .thumbnail ??
                                                  "",
                                              fit: BoxFit.cover,
                                            ),
                                            Center(
                                              child: Icon(
                                                Icons.play_arrow,
                                                color:
                                                    ThemeConstants.whitecolor,
                                                size: 50,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                  }),

                                  // YoutubePlayer(
                                  //   controller: YoutubePlayerController(
                                  //     initialVideoId: '$YtId',
                                  //     flags: const YoutubePlayerFlags(
                                  //       autoPlay: false,
                                  //       mute: false,
                                  //     ),
                                  //   ),
                                  //   showVideoProgressIndicator: true,
                                  //   progressIndicatorColor: Colors.red,
                                  // ),
                                ));
                          })),
                ])
          : getLoading(context),
    );
  }
}



class AllYoutubeVideoSection extends StatefulWidget {
  List<YoutubeVideoModel> youtubeVideoModel = [];
  bool isLoading;
  AllYoutubeVideoSection({super.key, required this.youtubeVideoModel, required this.isLoading});

  @override
  State<AllYoutubeVideoSection> createState() => _AllYoutubeVideoSectionState();
}

class _AllYoutubeVideoSectionState extends State<AllYoutubeVideoSection> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      key: _scaffoldKey,
      appBar:  AppBar(
        elevation: 2.5,
        automaticallyImplyLeading: false,
        actions: [
          if (displayMobileLayout == true)
            IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Colors.black),
              onPressed: () => Get.back(),
            ),
          if (displayMobileLayout == false)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child:  IconButton(
                // icon: Image.asset("assets/images/gradlynk lense.png"),
                icon: const Icon(Icons.arrow_back, color: Colors.black,),
                // icon: const Icon(Icons.menu,color: Colors.black,),
                onPressed: () {
                  // Get.find<BaseController>().profileDataValidator();
                  Get.deleteAll();
                  Get.back();

                  DrawerFilter();
                },
              ),
            ),
          // svgImage("work", Colors.transparent, 32, 32),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.network(
              "https://sieceducation.in/assets/assets/images/logo.png",
              width: 130,
              height: 30,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Row(
          //     children: [
          //     Text("Hi, ", style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
          //                         fontSize: 24,
          //                         fontWeight: FontWeight.w700,
          //                         color: Colors.black,
          //                       ),)),
          //       Text(
          //             style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
          //               fontSize: 24,
          //               fontWeight: FontWeight.w700,
          //               color: Colors.black,
          //             ),),
          //           "${firstLetterChaptial(controller.personalModal.enquiryName) ?? firstLetterChaptial(controller.model1.enquiryName)}"
          //         ),
          //     ],
          //   ),
          // ),
          const Spacer(),
          if (Get.find<BaseController>()
              .meetingZoneStatus
              .qrCodeGenerated ==
              true)
            IconButton(
              icon: svgImage(
                  "qr code", ThemeConstants.IconColor, 25, 25),
              onPressed: () {
                showAnimatedDialog(
                    animationType: DialogTransitionType.slideFromBottomFade,
                    curve: Curves.easeInOutQuart,
                    context: context,
                    builder: (_) => QRScreen(
                        Url: Get.find<BaseController>()
                            .meetingZoneStatus
                            .qrCodeView!,
                        code: Get.find<BaseController>()
                            .meetingZoneStatus
                            .student_code!));
              },
            ),

          // IconButton(
          //   icon: SvgPicture.asset(
          //     "assets/icons/profile.svg",
          //     height: 30,
          //     color: const Color.fromARGB(255, 99, 99, 99),
          //   ),
          //   onPressed: () {
          //     Get.toNamed(ProfilePage.routeNamed);
          //   },
          // ),

          const SizedBox(
            width: 5,
          )
        ],
        // title: Text(
        //   title,
        //   style: const TextStyle(color: Colors.black),
        // ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.youtubeVideoModel.length,
                  itemBuilder: (context, index) {
                    // var YtId = link[index]
                    //     .toString()
                    //     .substring(32, link[index].toString().length);
                    return Container(
                        width: 310,
                        height: 180,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: ThemeConstants.lightblueColor,
                            // gradient: LinearGradient(
                            //     colors: [Color(0xFF3E66DD), Color(0xFF6554CF)]),
                            // color: ThemeConstants.GreenColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: -0.2,
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              )],
                            // border: Border.all(
                            //     width: 0.8,
                            //     color: ThemeConstants.bluecolor),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10.0))),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(10.0)),
                          child: StatefulBuilder(builder:
                              (BuildContext context,
                              StateSetter setState) {
                            bool videoPlay = false;
                            if (videoPlay == true) {
                              return SizedBox(
                                width: 280,
                                child: YouTubeVideoPlayer(
                                  videoUrl:
                                  widget.youtubeVideoModel[index].video ??
                                      "",
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: () {
                                  Get.to(YouTubeVideoPlayer(
                                    videoUrl: widget.youtubeVideoModel[index]
                                        .video ??
                                        "",
                                  ));
                                },
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.network(
                                      widget.youtubeVideoModel[index]
                                          .thumbnail ??
                                          "",
                                      fit: BoxFit.cover,
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.play_arrow,
                                        color:
                                        ThemeConstants.whitecolor,
                                        size: 50,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          }),

                          // YoutubePlayer(
                          //   controller: YoutubePlayerController(
                          //     initialVideoId: '$YtId',
                          //     flags: const YoutubePlayerFlags(
                          //       autoPlay: false,
                          //       mute: false,
                          //     ),
                          //   ),
                          //   showVideoProgressIndicator: true,
                          //   progressIndicatorColor: Colors.red,
                          // ),
                        ));
                  })),
        ],
      ),
    );
  }
}
