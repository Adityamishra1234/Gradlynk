import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:studentpanel/binding/coursesearch.dart';
import 'package:studentpanel/binding/dashboard.dart';
import 'package:studentpanel/binding/detailbinding.dart';
import 'package:studentpanel/binding/loginbinding.dart';
import 'package:studentpanel/binding/profilepage.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/screen/ModificationUi/assigneeinformation.dart';
import 'package:studentpanel/ui/screen/ModificationUi/contactinformation.dart';
import 'package:studentpanel/ui/screen/ModificationUi/courseinformation.dart';
import 'package:studentpanel/ui/screen/ModificationUi/profilepage.dart';
import 'package:studentpanel/ui/screen/ModificationUi/qualificationdetails.dart';
import 'package:studentpanel/ui/screen/ModificationUi/trackapllication.dart';
import 'package:studentpanel/ui/screen/applicationcompletedetail.dart';
import 'package:studentpanel/ui/screen/applicationdetail.dart';
import 'package:studentpanel/ui/screen/applicationsummary.dart';
import 'package:studentpanel/ui/screen/coursesearch.dart';
import 'package:studentpanel/ui/screen/finalshortlist.dart';
import 'package:studentpanel/ui/screen/reviewshortlist.dart';
import 'package:studentpanel/ui/screen/fliter.dart';
import 'package:studentpanel/ui/screen/imageviewerscreen.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/lunchingpage.dart';
import 'package:studentpanel/ui/screen/mydocument.dart';
import 'package:studentpanel/ui/screen/otpscreen.dart';
import 'package:studentpanel/ui/screen/profilepage.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/detail.dart';
import 'package:studentpanel/ui/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/screen/sortcopy.dart';
import 'package:studentpanel/ui/screen/sort.dart';
import 'package:studentpanel/ui/screen/testautoscrolllistview.dart';
import 'package:studentpanel/ui/screen/trackapllication.dart';
import 'package:studentpanel/ui/screen/uploaddocument.dart';
import 'package:studentpanel/ui/screen/visa.dart';
import 'package:studentpanel/widgets/phonepelikeanimation.dart';
import 'package:studentpanel/widgets/scrolltabbar.dart';

void main() {
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
      initialRoute: Login.routeNamed,
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
          name: ProfilePage.routeNamed,
          transition: Transition.fade,
          binding: ProfilePageBinding(),
          page: () => ProfilePage(),
        ),
        GetPage(
          name: ProfilePageCopy.routeNamed,
          transition: Transition.fade,
          page: () => const ProfilePageCopy(),
        ),
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
        ),
        GetPage(
          name: ImageViewerScreen.routeNamed,
          transition: Transition.fade,
          page: () => const ImageViewerScreen(),
        ),
        GetPage(
          name: CourseSearch.routeNamed,
          transition: Transition.fade,
          binding: CourseSearchBinding(),
          page: () => CourseSearch(),
        ),
        GetPage(
          name: BottomSheetRemoveCourse.routeNamed,
          transition: Transition.fade,
          page: () => const BottomSheetRemoveCourse(),
        ),
        GetPage(
          name: Test1.routeNamed,
          transition: Transition.fade,
          page: () => const Test1(),
        ),
        // GetPage(
        //   name: Filter.routeNamed,
        //   transition: Transition.fade,
        //   page: () => const Filter(),
        // ),
        // GetPage(
        //   name: CourseSearchFullDetail.routeNamed,
        //   page: () => CourseSearchFullDetail(),
        // ),
        GetPage(
          name: TestAutoScrollListView.routeNamed,
          transition: Transition.fade,
          page: () => const TestAutoScrollListView(),
        ),
        GetPage(
          name: TrackApplication.routeNamed,
          transition: Transition.fade,
          page: () => const TrackApplication(),
        ),
        GetPage(
          name: TrackApplicationCopy.routeNamed,
          transition: Transition.fade,
          page: () => const TrackApplicationCopy(),
        ),
        GetPage(
          name: LunchingPage.routeNamed,
          transition: Transition.cupertino,
          page: () => LunchingPage(),
        ),
        GetPage(
          name: ContactInformationCopy.routeNamed,
          transition: Transition.cupertino,
          page: () => const ContactInformationCopy(),
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
        ),
        GetPage(
          name: ApplicationDetail.routeNamed,
          transition: Transition.cupertino,
          page: () => ApplicationDetail(),
        ),
        GetPage(
          name: FinalShortList.routeNamed,
          transition: Transition.cupertino,
          page: () => FinalShortList(),
        ),
        GetPage(
          name: ReviewShortList.routeNamed,
          page: () => ReviewShortList(),
          transition: Transition.fade,
        ),
        // GetPage(
        //   name: ApplicationCompleteDetails.routeNamed,
        //   page: () => ApplicationCompleteDetails(),
        //   transition: Transition.fade,
        // ),
        GetPage(
          name: VisaDetail.routeNamed,
          page: () => VisaDetail(),
          transition: Transition.fade,
        ),
        GetPage(
          name: AssigneeInformationCopy.routeNamed,
          page: () => const AssigneeInformationCopy(),
          transition: Transition.fade,
        ),
        GetPage(
          name: CourseInformationCopy.routeNamed,
          page: () => const CourseInformationCopy(),
          transition: Transition.fade,
        ),
        GetPage(
          name: QualificationDetailsCopy.routeNamed,
          page: () => const QualificationDetailsCopy(),
          transition: Transition.fade,
        ),
      ],
    );
  }
}
