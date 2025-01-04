import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/profile_view.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/dashboard/notification.dart';
import 'package:studentpanel/utils/theme.dart';

import '../ui/screen/course_search/finalshortlist.dart';

class CustomButtomNavbar extends StatefulWidget {
  static const routeNamed = '/mainScreen';
  BuildContext context2;
  CustomButtomNavbar(
      {super.key, required this.currentIndex, required this.context2});

  final int currentIndex;

  @override
  State<CustomButtomNavbar> createState() => _CustomButtomNavbarState();
}

class _CustomButtomNavbarState extends State<CustomButtomNavbar> {
  late int _currentIndex = widget.currentIndex;
  var controller = Get.put(BaseController(), permanent: true);
  // late List<Widget> _pages;

  @override
  void initState() {
    // _pages = [
    //   const PageOne(),
    //   const PageTwo(),
    //   const PageThree(),
    //   // PageFour(),
    // ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (_currentIndex == 0) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Exit"),
                  content: const Text("Are you sure you want to Exit?"),
                  actions: [
                    TextButton(
                      onPressed: () => SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop'),
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text(
                        "No",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                );
              });
        }
      },
      child: Container(
        color: Colors.transparent,
        child: SafeArea(
          top: false,
          child: CurvedNavigationBar(
            backgroundColor: Colors.transparent,

            // color: const Color(0xff1065c0),
            color: ThemeConstants.bluecolor,
            height: 55,
            index: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              if (_currentIndex == 0) {
                Get.toNamed(DashBoard.routeNamed);
              } else if (_currentIndex == 1) {
                Get.toNamed(ProfileView.routeNamed);
              } else if (_currentIndex == 2) {
                Get.toNamed(NotificationScreen.routeNamed);
              } else if (_currentIndex == 3) {
                Get.toNamed(FinalShortList.routeNamed);
              }

              // switch(index){
              //   case 0: Get.toNamed(DashBoard.routeNamed);
              //   break;
              //
              //   case 1:Get.to(const ProfileView());
              //   break;
              //
              //   case 2: Get.to(const NotificationScreen());
              //   break;
              //
              //   case 3: Get.toNamed(DashBoard.routeNamed);
              //   break;
              //
              //
              // }
            },

            items: const [
              Icon(Icons.home, color: Colors.white),
              Icon(Icons.person, color: Colors.white),
              Icon(Icons.notifications, color: Colors.white),
              // Icon(Icons.menu, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

// class PageOne extends StatefulWidget {
//   final String? name;
//   const PageOne({Key? key, this.name}) : super(key: key);
//   @override
//   State<PageOne> createState() => _PageOneState();
// }

// class _PageOneState extends State<PageOne> {
//   @override
//   Widget build(BuildContext context) {
//     return const DashBoard();
//   }
// }
//
// class PageTwo extends StatelessWidget {
//   const PageTwo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const ProfileView();
//   }
// }
//
// class PageThree extends StatelessWidget {
//   const PageThree({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return NotificationScreen();
//   }
// }

// class PageFour extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ProfilePageCopy();
//   }
// }
