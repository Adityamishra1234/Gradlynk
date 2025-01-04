import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studentpanel/presentation/features/event_history/bloc/event_history_bloc.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

import '../../../ui/controllers/basecontroller.dart';
import '../../../ui/screen/dashboard.dart';
import '../../../ui/screen/mark_attendance/qrCodeScreen.dart';
import '../../../widgets/drawerfilter.dart';

class EventHistoryView extends StatefulWidget {
  static const routeName = '/eventHistoryView';

  const EventHistoryView({super.key});

  @override
  State<EventHistoryView> createState() => _EventHistoryViewState();
}

class _EventHistoryViewState extends State<EventHistoryView> {
  late EventHistoryBloc eventHistoryBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    eventHistoryBloc = EventHistoryBloc();
    eventHistoryBloc.add(EventHistoryInitialEvent(0));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    return BlocConsumer<EventHistoryBloc, EventHistoryInitial>(
      bloc: eventHistoryBloc,
      listenWhen: (previous, current) => current is EventHistoryActionState,
      buildWhen: (previous, current) => current is! EventHistoryActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) async{
            return Get.offAllNamed(DashBoard.routeNamed);
          },
          child: Scaffold(
            key: _scaffoldKey,
            appBar:  AppBar(
              elevation: 2.5,
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.network(
                  "https://sieceducation.in/assets/assets/images/logo.png",
                  width: 130,
                  height: 30,
                ),
              ),
              automaticallyImplyLeading: true,
              iconTheme:
              IconThemeData(color: ThemeConstants.blackcolor),
              actions: [
                // if (displayMobileLayout == true)
                //   IconButton(
                //     icon: const Icon(Icons.arrow_back,
                //         color: Colors.black),
                //     onPressed: () => Get.back(),
                //   ),
                // if (displayMobileLayout == false)
                //   Padding(
                //     padding: const EdgeInsets.only(left: 10),
                //     child:  IconButton(
                //       // icon: Image.asset("assets/images/gradlynk lense.png"),
                //       icon: const Icon(Icons.menu, color: Colors.black,),
                //       // icon: const Icon(Icons.menu,color: Colors.black,),
                //       onPressed: () {
                //         // Get.find<BaseController>().profileDataValidator();
                //         _scaffoldKey.currentState!.openDrawer();
                //
                //         DrawerFilter();
                //       },
                //     ),
                //   ),
                // // svgImage("work", Colors.transparent, 32, 32),
                // const Spacer(),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Image.network(
                //     "https://sieceducation.in/assets/assets/images/logo.png",
                //     width: 130,
                //     height: 30,
                //   ),
                // ),
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
                // const Spacer(),
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
            drawer: CustomDrawer(
              index: 9,
            ),
            body: SafeArea(
              child: Container(
                // color: ThemeConstants.lightblueColor2,
                decoration:  BoxDecoration(
                  color: ThemeConstants.lightblueColor2,
                  // image: const DecorationImage(
                  //   image: AssetImage("assets/images/event_history_background.png",),
                  //   fit: BoxFit.fill,
                  //   opacity: 0.4
                  // )
                ),
                alignment: Alignment.topCenter,
                child: Column(children: [
                  if (state is EventHistoryInitial) ...[
                    if (state.status == Status.loading) ...[
                      getLoading(context)
                    ] else if (state.status == Status.loaded) ...[
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Image.network(
                      //     "https://sieceducation.in/assets/assets/images/logo.png",
                      //     width: 150,
                      //     height: 50,
                      //   ),
                      // ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: CustomAutoSizeTextMontserrat(
                          text: 'Event History',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          textColor: ThemeConstants.blackcolor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // if (state is EventHistoryFetchedState) ...[
                      SizedBox(
                        height: 45,
                        width: MediaQuery.sizeOf(context).width - 20,
                        child: customDropDownPlanFund(
                          selectedValueByID: state.eventId,
                          model: state.nameListOfEventHistory,
                          callback: (value) {
                            print(value);
                            eventHistoryBloc
                                .add(EventHistoryClickEvent(value, ''));
                            // controller.selectedRelationship =
                            //     controller.relationShip[value];
                            // controller.update();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: ThemeConstants.lightblueColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                spreadRadius: 10,
                                blurRadius: 9,
                                offset: const Offset(0, 6),
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                            padding:const EdgeInsets.all(20.0),
                            children: [
                              Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CustomAutoSizeTextMontserrat(
                                  text: state.nameOfEvent,
                                  textColor: ThemeConstants.bluecolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ...state.eventHistoryTimelineWidget
                        ]),
                      ))
                    ]
                  ]
                ]
                    // ],
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/////
///
///
///      success: true,
///      model: [
/// {
/// name: "event start",
/// time: '120',
/// icon: '',
///
/// }
/// ]
