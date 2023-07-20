import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/dashboard/notification.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/drawerfilter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  const CustomAppBar(
    this.title, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: AppBar(
        elevation: 0,
        actions: [
          if (displayMobileLayout == true)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.back(),
            ),
          if (displayMobileLayout == false)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon: svgImage("menu", ThemeConstants.IconColor, 35, 35),
                onPressed: () {
                  Get.find<BaseController>().profileDataValidator();
                  Scaffold.of(context).openDrawer();
                  DrawerFilter();
                },
              ),
            ),
          // svgImage("work", Colors.transparent, 32, 32),

          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.network(
              "https://sieceducation.in/assets/assets/images/logo.png",
              width: 150,
              height: 50,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: svgImage("notification", ThemeConstants.IconColor, 30, 30),
            onPressed: () {
              //TODO
              Get.to(const NotificationScreen());
            },
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

  //Funcation
  callbacktest(data) {
    print(data);
  }
}
