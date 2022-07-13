import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/screen/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatefulWidget {
  UserModel model;
  DashBoard({Key? key, required this.model}) : super(key: key);
  static const routeNamed = '/DashBoard';

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  UserModel? model;
  var dashboardController = Get.put(DashboardController());

//Aman Verma

  @override
  void initState() {
    model = widget.model;
    dashboardController.newAndUpdates();
    dashboardController.upcomingEvents();
    dashboardController.upcomingholidays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Text("Aman Soni verma Dashboard"),
            TextButton(
                onPressed: () {
                  dashboardController.removeAllData();
                },
                child: const Text("Remove Data Or Logout")),
            TextButton(
                onPressed: () {
                  dashboardController.updateUserHistory("Logout");
                },
                child: const Text("Update User History")),
            TextButton(
                onPressed: () {
                  Get.toNamed(DetialScreen.routeNamed);
                },
                child: const Text("Detail Page")),
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  Text("  id  ${model?.user.id}"),
                  Text("  empId  ${model?.user.empId}"),
                  Text("  name  ${model?.user.name}"),
                  Text("  email  ${model?.user.email}"),
                  Text("  emailpassword  ${model?.user.emailPassword}"),
                  Text("  emailVerifiedAt  ${model?.user.emailVerifiedAt}"),
                  Text("  profilePhoto  ${model?.user.profilePhoto}"),
                  Text("  macAddress  ${model?.user.macAddress}"),
                  Text("  ipAddress  ${model?.user.ipAddress}"),
                  Text("  tokenId  ${model?.user.tokenId}"),
                  Text("  lastOnline  ${model?.user.lastOnline}"),
                  Text("  createdAt  ${model?.user.createdAt}"),
                  Text("  updatedAt  ${model?.user.updatedAt}"),
                  Text("  isUserActive  ${model?.user.isUserActive}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
