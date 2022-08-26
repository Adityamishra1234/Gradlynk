import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/profilepage.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/drawerfilter.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  CustomAppBar(
    this.title, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/menu.svg",
                color: ThemeConstants.IconColor,
                height: 30,
                width: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                DrawerFilter();
              },
            ),
          ),
          SvgPicture.asset(
            "assets/icons/work.svg",
            width: 32,
            color: Colors.transparent,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              "assets/images/logo.png",
              width: 150,
              height: 50,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/notification.svg",
              color: ThemeConstants.IconColor,
              height: 27,
            ),
            onPressed: () {},
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
    );
  }
}
