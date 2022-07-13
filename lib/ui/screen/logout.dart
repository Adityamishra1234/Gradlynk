import 'package:studentpanel/ui/viewmodel/logoutviewmodel.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  Logout({Key? key}) : super(key: key);

  LogoutViewModel logoutViewModel = LogoutViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () {
          logoutViewModel.logout(Endpoints.baseUrl!, Endpoints.logout!);
        },
        child: const Center(child: Text("Logout")),
      )),
    );
  }
}
