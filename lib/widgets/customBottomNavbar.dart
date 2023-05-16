import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profile_page_copy.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/profile_view.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/dashboard/notification.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/raise_new_ticket.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/track_your_tickets.dart';
import 'package:studentpanel/ui/screen/settings_ui.dart';
import 'package:studentpanel/utils/theme.dart';

class CustomButtomNavbar extends StatelessWidget {
  CustomButtomNavbar({required this.currentIndex});

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
          Get.to(NotificationScreen());
        } else if (i == 3) {
          Get.toNamed(Settings.routeNamed);
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
          icon: const Icon(Icons.notifications_active_outlined),
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
          icon: const Icon(Icons.menu),
          title: const Text("Settings"),
          selectedColor: ThemeConstants.bluecolor,
        ),

        /// Profile
      ],
    );
  }
}
