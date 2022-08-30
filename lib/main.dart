import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:studentpanel/binding/coursesearch.dart';
import 'package:studentpanel/binding/dashboard.dart';
import 'package:studentpanel/binding/detailbinding.dart';
import 'package:studentpanel/binding/loginbinding.dart';
import 'package:studentpanel/binding/profilepage.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/screen/coursesearch.dart';
import 'package:studentpanel/ui/screen/imageviewerscreen.dart';
import 'package:studentpanel/ui/screen/lunchingpage.dart';
import 'package:studentpanel/ui/screen/otpscreen.dart';
import 'package:studentpanel/ui/screen/profilepage.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/detail.dart';
import 'package:studentpanel/ui/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/screen/test%20copy.dart';
import 'package:studentpanel/ui/screen/test.dart';
import 'package:studentpanel/ui/screen/testautoscrolllistview.dart';
import 'package:studentpanel/ui/screen/trackapllication.dart';
import 'package:studentpanel/ui/screen/uploaddocument.dart';
import 'package:studentpanel/widgets/phonepelikeanimation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemStatusBarContrastEnforced: true));
  // SystemChrome.setEnabledSystemUIOverlays([]);
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MyAp());
}

class MyAp extends StatefulWidget {
  const MyAp({Key? key}) : super(key: key);

  @override
  State<MyAp> createState() => _MyApState();
}

class _MyApState extends State<MyAp> {
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
            name: Login.routeNamed,
            page: () => const Login(),
            transition: Transition.fade,
            binding: LoginBinding()),
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
          name: Test.routeNamed,
          transition: Transition.fade,
          page: () => Test(),
        ),
        GetPage(
          name: Test1.routeNamed,
          transition: Transition.fade,
          page: () => Test1(),
        ),
        // GetPage(
        //   name: CourseSearchFullDetail.routeNamed,
        //   page: () => CourseSearchFullDetail(),
        // ),
        GetPage(
          name: TestAutoScrollListView.routeNamed,
          transition: Transition.fade,
          page: () => TestAutoScrollListView(),
        ),
        GetPage(
          name: TrackApplication.routeNamed,
          transition: Transition.fade,
          page: () => TrackApplication(),
        ),
        GetPage(
          name: LunchingPage.routeNamed,
          transition: Transition.fade,
          page: () => LunchingPage(),
        ),
      ],
    );
  }
}
