import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:studentpanel/binding/applicationdetails.dart';
import 'package:studentpanel/binding/applicationsummary.dart';
import 'package:studentpanel/binding/coursesearch.dart';
import 'package:studentpanel/binding/dashboard.dart';
import 'package:studentpanel/binding/detailbinding.dart';
import 'package:studentpanel/binding/finalshortlist.dart';
import 'package:studentpanel/binding/profilepage.dart';
import 'package:studentpanel/binding/reviewshortlist.dart';
import 'package:studentpanel/binding/trackapplication.dart';
import 'package:studentpanel/binding/uploaddocument.dart';
import 'package:studentpanel/binding/visasummary.dart';
import 'package:studentpanel/fcm/notification_service.dart';
import 'package:studentpanel/presentation/features/event_history/event_history_view.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/screen/Delete/assigneeinformation.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/profile_view.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch2.dart';
import 'package:studentpanel/ui/screen/dashboard/bookanappointment.dart';
import 'package:studentpanel/ui/screen/dashboard/notification.dart';
import 'package:studentpanel/ui/screen/fund/fund_parameter.dart';
import 'package:studentpanel/ui/screen/fund/fund_requiremen.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/raise_new_ticket.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/suggestedimprovisation.dart';
import 'package:studentpanel/ui/screen/internet_connection.dart';
import 'package:studentpanel/ui/screen/letsGetStarted/letsGetStartedMainVIew.dart';
import 'package:studentpanel/ui/screen/mark_attendance/eventdocumentupload.dart';
import 'package:studentpanel/ui/screen/receiveACallback/ui/recieveACallback_view.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_main_view.dart';
import 'package:studentpanel/ui/screen/track_application/trackapllication2.dart';
import 'package:studentpanel/ui/screen/Visa/visasummary.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';
import 'package:studentpanel/ui/screen/track_application/applicationdetail.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationsummary.dart';
import 'package:studentpanel/ui/screen/course_search/finalshortlist.dart';
import 'package:studentpanel/ui/screen/course_search/reviewshortlist.dart';
import 'package:studentpanel/ui/screen/imageviewerscreen.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/Delete/mydocument.dart';
import 'package:studentpanel/ui/screen/otpscreen.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/Delete/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Delete/sortcopy.dart';
import 'package:studentpanel/ui/screen/test/documentdownload.dart';
import 'package:studentpanel/ui/screen/test/stage_profilemodule.dart';
import 'package:studentpanel/ui/screen/test/timepickertest.dart';
import 'package:studentpanel/ui/screen/track_application/testautoscrolllistview.dart';
import 'package:studentpanel/ui/screen/track_application/trackapllication.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/ui/screen/welcomeScreen/welcome_view.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/phonepelikeanimation.dart';
import 'package:studentpanel/widgets/scrolltabbar.dart';
import 'ui/screen/Login_Module/animationtest.dart';
import 'ui/screen/My_Application/applicationcompletedetail.dart';
import 'ui/screen/countryGuide/countryguide.dart';
import 'ui/screen/dashboard/scheduleExpertCall.dart';

import 'ui/screen/gradlynk_support/track_your_tickets.dart';
import 'ui/screen/test/test.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

// import files from firebase
import 'package:firebase_core/firebase_core.dart';



@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class DownloadClass {
  static void callback(String id, int status, int progress) {
    print('Download Status: $status');
    print('Download Prgress: $progress');
  }
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ThemeConstants.whitecolor,
    systemStatusBarContrastEnforced: false,
    statusBarColor: ThemeConstants.bluecolor,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserModel? userModel;

  bool dashboardscreen = false;
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    hideScreen();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });

    super.initState();
  }

  Future<void> hideScreen() async {

    if (Platform.isIOS) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        FlutterSplashScreen.hide();
      });
    } else {
      Future.delayed(const Duration(milliseconds: 5100), () {
        FlutterSplashScreen.hide();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
        primaryColor: const Color(0xff1a84b8),
        // primarySwatch: Colors.blue,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }
        ),
      ),
      title: "S2C_studentpanel",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => WelcomeView(),
        ),
        GetPage(
          name: ReceiveACallBackView.routeNamed,
          page: () => ReceiveACallBackView(),
        ),
        GetPage(
          name: FundParameter.routeNamed,
          page: () => FundParameter(),
        ),
        GetPage(
          name: FundPlan.routenamed,
          page: () => FundPlan(),
        ),

        GetPage(
          name: LetsGetStartedMainView.routeNamed,
          page: () => LetsGetStartedMainView(),
        ),

        GetPage(
          name: EventHistoryView.routeName,
          page: () => const EventHistoryView(),
        ),
        GetPage(
          name: Fundrequirement.routenamed,
          page: () => Fundrequirement(),
        ),
        // GetPage(
        //   name: "/",
        //   page: () => LoginCopy(),
        //   transition: Transition.fade,
        // ),
        GetPage(
          name: LoginCopy.routeNamed,
          page: () => const LoginCopy(),
            transition: Transition.downToUp
        ),
        // GetPage(
        //   name: LoginScreen.routeNamed,
        //   page: () => LoginScreen(),
        //   transition: Transition.fade,
        // ),
        // GetPage(
        //   name: Login.routeNamed,
        //   page: () => const Login(),
        //   transition: Transition.fade,
        // ),
        GetPage(
          name: RegisterationMainView.routeNmaed,
          page: () => const RegisterationMainView(),
            transition: Transition.downToUp
        ),
        GetPage(
          name: MyDocument.routeNamed,
          page: () => const MyDocument(),
            transition: Transition.downToUp
        ),
        GetPage(
          name: DashBoard.routeNamed,
          // transition: Transition.cupertino,
          binding: DashBoardBinding(),
          page: () => const DashBoard(),
          transition: Transition.upToDown,
            transitionDuration: const Duration(milliseconds: 100),
        ),
        // GetPage(
        //     name: ProfilePageCopy1.routeNamed,
        //     transition: Transition.cupertino,
        //     page: () => ProfilePageCopy1(),
        //     binding: ProfilePageBinding()),
        GetPage(
            name: ProfilePageCopy.routeNamed,
            // transition: Transition.zoom,
            page: () => ProfilePageCopy(),
            transition: Transition.downToUp,
            binding: ProfilePageBinding()),
        GetPage(
            name: DetialScreen.routeNamed,
            page: () => const DetialScreen(),
            transition: Transition.downToUp,
            // transition: Transition.fade,
            binding: DetailBinding()),

        //AnimationaPhonepe
        GetPage(
          name: AnimationaPhonepe.routeNamed,
          transition: Transition.downToUp,
          page: () => const AnimationaPhonepe(),
        ),
        GetPage(
          name: OTPScreen.routeNamed,
          // transition: Transition.fade,
          page: () => OTPScreen(),
          transition: Transition.downToUp,
        ),
        // GetPage(
        //     name: UploadDocument.routeNamed,
        //     transition: Transition.fade,
        //     page: () =>  UploadDocument(),
        //     binding: UploadDocumentBinding()),
        GetPage(
          name: ImageViewerScreen.routeNamed,
          // transition: Transition.fade,
          page: () => const ImageViewerScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: CourseSearch2.routeNamed,
          // transition: Transition.fade,
          transition: Transition.downToUp,
          binding: CourseSearchBinding(),
          page: () => const CourseSearch2(),
        ),

        GetPage(
          name: Test1.routeNamed,
          // transition: Transition.fade,
          transition: Transition.downToUp,
          page: () => const Test1(),
        ),

        GetPage(
          name: TestAutoScrollListView.routeNamed,
          // transition: Transition.fade,
          page: () => const TestAutoScrollListView(),
          transition: Transition.downToUp,
        ),
        GetPage(
            name: TrackApplication.routeNamed,
            // transition: Transition.fade,
            page: () => const TrackApplication(),
            transition: Transition.downToUp,
            binding: TrackApplicationBinding()),
        GetPage(
            name: TrackApplicationCopy.routeNamed,
            // transition: Transition.fade,
            transition: Transition.downToUp,
            page: () => const TrackApplicationCopy(),
            binding: TrackApplicationBinding()),
        // GetPage(
        //   name: LunchingPage.routeNamed,
        //   transition: Transition.cupertino,
        //   page: () => const LunchingPage(),
        // ),
        GetPage(
          name: AnimationTest.routeNamed,
          // transition: Transition.cupertino,
          transition: Transition.downToUp,
          page: () => const AnimationTest(),
        ),

        GetPage(
          name: ScrollTabBar.routeNamed,
          // transition: Transition.cupertino,
          transition: Transition.downToUp,
          page: () => ScrollTabBar(),
        ),
        GetPage(
            name: ApplicationSummary.routeNamed,
            // transition: Transition.cupertino,
            transition: Transition.downToUp,
            page: () => ApplicationSummary(),
            binding: ApplicationSummaryBinding()),
        GetPage(
            name: ApplicationDetail.routeNamed,
            // transition: Transition.cupertino,
            transition: Transition.downToUp,
            page: () => const ApplicationDetail(),
            binding: ApplicationDetailBinding()),
        GetPage(
            name: FinalShortList.routeNamed,
            // transition: Transition.cupertino,
            transition: Transition.downToUp,
            page: () => FinalShortList(),
            binding: FinalShortListBinding()),
        GetPage(
          name: ReviewShortList.routeNamed,
          page: () => ReviewShortList(),
          // transition: Transition.fade,
          transition: Transition.downToUp,
          binding: ReviewShortListBinding(),
        ),

        GetPage(
          name: AssigneeInformationCopy.routeNamed,
          page: () => const AssigneeInformationCopy(),
          transition: Transition.downToUp,
          // transition: Transition.fade,
        ),

        GetPage(
            name: VisaSummary.routeNamed,
            page: () => VisaSummary(),
            // transition: Transition.fade,
            transition: Transition.downToUp,
            binding: VisaSummaryBinding()),
        GetPage(
            name: UploadDocument.routeNamed,
            page: () => UploadDocument(),
            // transition: Transition.fade,
            transition: Transition.downToUp,
            binding: UploadDocumentBinding()),
        GetPage(
          name: DocumentTest.routeNamed,
          page: () => const DocumentTest(),
          // transition: Transition.fade,
          transition: Transition.downToUp,
        ),
        GetPage(
          name: TimepickerDemo.routeNamed,
          page: () => const TimepickerDemo(),
          // transition: Transition.fade,
          transition: Transition.downToUp,
        ),
        GetPage(
          name: StageProgress.routeNamed,
          page: () => const StageProgress(),
          // transition: Transition.fade,
          transition: Transition.downToUp,
        ),
        GetPage(
          name: ApplicationCompleteDetails.routeNamed,
          page: () => const ApplicationCompleteDetails(),
          // transition: Transition.fade,
        ),
        GetPage(
          name: InternetConnectionStatusScreen.routeNamed,
          page: () => InternetConnectionStatusScreen(),
          // transition: Transition.fade,
        ),
        GetPage(
          name: ScheduleExpertCall.routeNamed,
          page: () => ScheduleExpertCall(),
          // transition: Transition.fade,
        ),
        GetPage(
          name: BookAnAppointment.routeNamed,
          page: () => BookAnAppointment(),
          // transition: Transition.fade,
        ),
        GetPage(
          name: CountryGuide.routeNamed,
          page: () => CountryGuide(),
          // transition: Transition.fade,
        ),
        GetPage(
          name: TestWidget.routeNamed,
          page: () => const TestWidget(),
          // transition: Transition.fade,
        ),
        GetPage(
          name: TrackyourTickets.routeNamed,
          page: () => TrackyourTickets(),
          transition: Transition.downToUp,
          // transition: Transition.fade,
        ),
        GetPage(
          name: Suggestedimprovisation.routeNamed,
          page: () => Suggestedimprovisation(),
          // transition: Transition.fade,
        ),
        GetPage(
          name: RaiseYourTicket.routeNamed,
          page: () => RaiseYourTicket(),
          transition: Transition.downToUp,
          // transition: Transition.fade,
        ),
        GetPage(
            name: ProfileView.routeNamed,
            // transition: Transition.fade,
            // page: () => ProfilePageCopy1(),
            page: () => const ProfileView(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.upToDown,

            binding: ProfilePageBinding()),
        GetPage(
          name: EventDocumentUpload.routeNamed,
          // transition: Transition.fade,
          page: () => EventDocumentUpload(),
          transition: Transition.upToDown,
        ),
        GetPage(
          name: NotificationScreen.routeNamed,
          // transition: Transition.fade,
          page: () => NotificationScreen(),
          transition: Transition.upToDown,
          transitionDuration: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
