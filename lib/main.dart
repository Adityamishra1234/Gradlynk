import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:studentpanel/binding/applicationdetails.dart';
import 'package:studentpanel/binding/applicationsummary.dart';
import 'package:studentpanel/binding/coursesearch.dart';
import 'package:studentpanel/binding/dashboard.dart';
import 'package:studentpanel/binding/detailbinding.dart';
import 'package:studentpanel/binding/finalshortlist.dart';
import 'package:studentpanel/binding/loginbinding.dart';
import 'package:studentpanel/binding/profilepage.dart';
import 'package:studentpanel/binding/reviewshortlist.dart';
import 'package:studentpanel/binding/trackapplication.dart';
import 'package:studentpanel/binding/uploaddocument.dart';
import 'package:studentpanel/binding/visasummary.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/screen/ModificationUi/assigneeinformation.dart';
import 'package:studentpanel/ui/screen/ModificationUi/trackapllication.dart';
import 'package:studentpanel/ui/screen/ModificationUi/visasummary.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';
import 'package:studentpanel/ui/screen/applicationdetail.dart';
import 'package:studentpanel/ui/screen/applicationsummary.dart';
import 'package:studentpanel/ui/screen/coursesearch.dart';
import 'package:studentpanel/ui/screen/finalshortlist.dart';
import 'package:studentpanel/ui/screen/remove_compare_course.dart';
import 'package:studentpanel/ui/screen/reviewshortlist.dart';
import 'package:studentpanel/ui/screen/imageviewerscreen.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/lunchingpage.dart';
import 'package:studentpanel/ui/screen/mydocument.dart';
import 'package:studentpanel/ui/screen/otpscreen.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/detail.dart';
import 'package:studentpanel/ui/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/screen/sortcopy.dart';
import 'package:studentpanel/ui/screen/test/documentdownload.dart';
import 'package:studentpanel/ui/screen/test/stage_profilemodule.dart';
import 'package:studentpanel/ui/screen/test/timepickertest.dart';

import 'package:studentpanel/ui/screen/testautoscrolllistview.dart';
import 'package:studentpanel/ui/screen/trackapllication.dart';
import 'package:studentpanel/ui/screen/uploaddocument.dart';
import 'package:studentpanel/widgets/phonepelikeanimation.dart';
import 'package:studentpanel/widgets/scrolltabbar.dart';

import 'ui/screen/test/animationtest.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemStatusBarContrastEnforced: true));
  // SystemChrome.setEnabledSystemUIOverlays([]);
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserModel? userModel;

  @override
  void initState() {
    // getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    var temp = await Get.put(LoginController()).checkUserData();
    if (temp == false) {
      Get.toNamed(Login.routeNamed);
    } else {
      Get.toNamed(DashBoard.routeNamed);
      getUserData();
    }
  }

  getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jsondata =
        json.decode(sharedPreferences.getString("UserModel").toString());
    userModel = UserModel.fromJson(jsondata);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "S2C_studentpanel",
      debugShowCheckedModeBanner: false,
      // Initial Route
      initialRoute: DashBoard.routeNamed,
      // Create Route
      getPages: [
        GetPage(name: "/", page: () => const Login(), binding: LoginBinding()),
        GetPage(
            name: LoginCopy.routeNamed,
            page: () => const LoginCopy(),
            transition: Transition.fade,
            binding: LoginBinding()),
        GetPage(
            name: Login.routeNamed,
            page: () => const Login(),
            transition: Transition.fade,
            binding: LoginBinding()),
        GetPage(
          name: MyDocument.routeNamed,
          page: () => const MyDocument(),
          transition: Transition.fade,
        ),
        GetPage(
          name: DashBoard.routeNamed,
          transition: Transition.fade,
          binding: DashBoardBinding(),
          page: () => const DashBoard(),
        ),
        GetPage(
            name: DetialScreen.routeNamed,
            page: () => const DetialScreen(),
            transition: Transition.fade,
            binding: DetailBinding()),

        GetPage(
            name: ProfilePageCopy.routeNamed,
            transition: Transition.fade,
            page: () => ProfilePageCopy(),
            binding: ProfilePageBinding()),
        //AnimationaPhonepe
        GetPage(
          name: AnimationaPhonepe.routeNamed,
          transition: Transition.fade,
          page: () => const AnimationaPhonepe(),
        ),
        GetPage(
          name: OTPScreen.routeNamed,
          transition: Transition.fade,
          page: () => OTPScreen(),
        ),
        GetPage(
            name: UploadDocument.routeNamed,
            transition: Transition.fade,
            page: () => UploadDocument(),
            binding: UploadDocumentBinding()),
        GetPage(
          name: ImageViewerScreen.routeNamed,
          transition: Transition.fade,
          page: () => const ImageViewerScreen(),
        ),
        GetPage(
          name: CourseSearch.routeNamed,
          transition: Transition.fade,
          binding: CourseSearchBinding(),
          page: () => const CourseSearch(),
        ),

        GetPage(
          name: Test1.routeNamed,
          transition: Transition.fade,
          page: () => const Test1(),
        ),

        GetPage(
          name: TestAutoScrollListView.routeNamed,
          transition: Transition.fade,
          page: () => const TestAutoScrollListView(),
        ),
        GetPage(
            name: TrackApplication.routeNamed,
            transition: Transition.fade,
            page: () => const TrackApplication(),
            binding: TrackApplicationBinding()),
        GetPage(
            name: TrackApplicationCopy.routeNamed,
            transition: Transition.fade,
            page: () => const TrackApplicationCopy(),
            binding: TrackApplicationBinding()),
        GetPage(
          name: LunchingPage.routeNamed,
          transition: Transition.cupertino,
          page: () => const LunchingPage(),
        ),
        GetPage(
          name: AnimationTest.routeNamed,
          transition: Transition.cupertino,
          page: () => const AnimationTest(),
        ),

        GetPage(
          name: ScrollTabBar.routeNamed,
          transition: Transition.cupertino,
          page: () => ScrollTabBar(),
        ),
        GetPage(
            name: ApplicationSummary.routeNamed,
            transition: Transition.cupertino,
            page: () => ApplicationSummary(),
            binding: ApplicationSummaryBinding()),
        GetPage(
            name: ApplicationDetail.routeNamed,
            transition: Transition.cupertino,
            page: () => const ApplicationDetail(),
            binding: ApplicationDetailBinding()),
        GetPage(
            name: FinalShortList.routeNamed,
            transition: Transition.cupertino,
            page: () => FinalShortList(),
            binding: FinalShortListBinding()),
        GetPage(
          name: ReviewShortList.routeNamed,
          page: () => ReviewShortList(),
          transition: Transition.fade,
          binding: ReviewShortListBinding(),
        ),

        GetPage(
          name: AssigneeInformationCopy.routeNamed,
          page: () => const AssigneeInformationCopy(),
          transition: Transition.fade,
        ),

        GetPage(
            name: VisaSummary.routeNamed,
            page: () => VisaSummary(),
            transition: Transition.fade,
            binding: VisaSummaryBinding()),
        GetPage(
            name: UploadDocument.routeNamed,
            page: () => UploadDocument(),
            transition: Transition.fade,
            binding: UploadDocumentBinding()),
        GetPage(
          name: DocumentTest.routeNamed,
          page: () => DocumentTest(),
          transition: Transition.fade,
        ),
        GetPage(
          name: TimepickerDemo.routeNamed,
          page: () => const TimepickerDemo(),
          transition: Transition.fade,
        ),
        GetPage(
          name: StageProgress.routeNamed,
          page: () => const StageProgress(),
          transition: Transition.fade,
        ),
      ],
    );
  }
}
