import 'dart:convert';

import 'package:studentpanel/binding/detailbinding.dart';
import 'package:studentpanel/binding/loginbinding.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/profilepage.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/detail.dart';
import 'package:studentpanel/ui/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/screen/profilepagehorizontal.dart';

void main() {
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
      // Create Route
      initialRoute: ProfilePageHorizontal.routeNamed,
      getPages: [
        GetPage(name: "/", page: () => const Login(), binding: LoginBinding()),
        GetPage(
            name: Login.routeNamed,
            page: () => Login(),
            binding: LoginBinding()),
        GetPage(
          name: DashBoard.routeNamed,
          page: () => DashBoard(),
          transition: Transition.native,
          transitionDuration: const Duration(seconds: 3),
        ),
        GetPage(
            name: DetialScreen.routeNamed,
            page: () => const DetialScreen(),
            binding: DetailBinding()),
        GetPage(
          name: ProfilePage.routeNamed,
          page: () => ProfilePage(),
        ),
        GetPage(
          name: ProfilePage.routeNamed,
          page: () => ProfilePage(),
        ),
        GetPage(
          name: ProfilePageHorizontal.routeNamed,
          page: () => ProfilePageHorizontal(),
        ),
      ],
    );
  }
}
