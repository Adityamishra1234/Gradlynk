import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/profile_view.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/dashboard/notification.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/custom_dialog_box.dart';

class CustomButtomNavbar extends StatelessWidget {
  BuildContext context2;
  CustomButtomNavbar({super.key, required this.currentIndex, required this.context2});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: currentIndex,
      onTap: (i) {
        if (i == 0) {
          Get.toNamed(DashBoard.routeNamed);
        } else if (i == 1) {
          // Get.toNamed(ProfilePageCopy1.routeNamed);
          Get.toNamed(ProfileView.routeNamed);
        } else if (i == 2) {
          Get.to(const NotificationScreen());
        } else if (i == 3) {
          supportDialog(context2);
        }
        // else if (i == 4) {
        //   Get.toNamed(ProfilePageCopy.routeNamed);
        // }
      },
      // setState(() => _currentIndex = i),
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text("Home"),
          selectedColor: ThemeConstants.bluecolor,
        ),

        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text("Profile"),
          selectedColor: ThemeConstants.bluecolor,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(Icons.notifications),
          title: const Text("Notifications"),
          selectedColor: ThemeConstants.bluecolor,
        ),
        //SVO
        // SalomonBottomBarItem(
        //   icon: const Icon(Icons.video_call),
        //   title: const Text("Join SVO"),
        //   selectedColor: ThemeConstants.bluecolor,
        // ),

        /// Search
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.help_outline_sharp,
          ),
          //   child: svgImage(
          //       "track",
          //       currentIndex == 3
          //           ? ThemeConstants.bluecolor
          //           : ThemeConstants.blackcolor,
          //       25,
          //       25),
          // ),
          title: const Text("Gradlynk Support"),
          selectedColor: ThemeConstants.bluecolor,
        ),

        /// Profile
      ],
    );
  }
}
