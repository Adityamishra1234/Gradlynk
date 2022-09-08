import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () {
          // logoutViewModel.logout(Endpoints.baseUrl!, Endpoints.logout!);
        },
        child: const Center(child: Text("Logout")),
      )),
    );
  }
}
