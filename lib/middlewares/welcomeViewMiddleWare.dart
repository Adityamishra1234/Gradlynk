// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/root/parse_route.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:studentpanel/binding/serviceIniitial.dart';
// import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
// import 'package:studentpanel/ui/screen/dashboard.dart';
// import 'package:studentpanel/ui/screen/welcomeScreen/welcome_view_controller.dart';

// class WelcomeViewMiddleWare extends GetMiddleware {
//   @override
//   RouteSettings? redirect(String? route) {
//     var _sigenedInUser = Get.find<GetSignedInUserInfoRepoImp>();

//     print(_sigenedInUser.isLoggedIn);
//     if (_sigenedInUser.isLoggedIn == false) {
//       return const RouteSettings(name: '/wel');
//     } else {
//       return const RouteSettings(name: DashBoard.routeNamed);
//     }
//   }

//   // @override
//   // Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
//   //   // you can do whatever you want here
//   //   // but it's preferable to make this method fast
//   //   // await Future.delayed(Duration(milliseconds: 500));

//   //   // var phonenumber = check();
//   //   print('ffff');
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String? phonenumber = prefs.getString("phonenumber");

//   //   if (phonenumber == null) {
//   //     return Get.toNamed('/');
//   //   } else {
//   //     return Get.to(DashBoard.routeNamed  , b);
//   //   }
//   // }

//   // check() async {
//   //   return phonenumber;
//   // }

//   //   if (!AuthService.to.isLoggedInValue) {
//   //     final newRoute = Routes.LOGIN_THEN(route.pageSettings!.name);
//   //     return RouteDecoder.fromRoute(newRoute);
//   //   }
//   //   return await super.redirectDelegate(route);
//   // }
// }
