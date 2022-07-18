import 'package:google_fonts/google_fonts.dart';

import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/widgets/bottomnavigation.dart';
import 'package:studentpanel/widgets/drawerfilter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const routeNamed = '/Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
        backgroundColor: Colors.green,
      ),
      drawer: DrawerFilter(),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: Constants.linearGradient,
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Center(
                  heightFactor: 0.8,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Image.asset(
                      "assets/images/logo.png",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                    child: Text(
                  "Your International study patner",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF011B67),
                        letterSpacing: .5),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
                child: Text(
                  " Your Email ID",
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                  child: AutofillGroup(
                    child: TextField(
                      autofillHints: const [AutofillHints.email],
                      onChanged: (value) {
                        password = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        // disabledBorder: InputBorder.none,

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelStyle: TextStyle(color: Color(0xFF424242)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                child: Text(
                  "Password",
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      // disabledBorder: InputBorder.none,

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelStyle: TextStyle(color: Color(0xFF424242)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF0A4499),
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontStyle: FontStyle.normal),
                    ),
                    onPressed: () {
                      Get.toNamed(DashBoard.routeNamed);
                    },
                    child: Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
      floatingActionButtonLocation:
          showFab ? FloatingActionButtonLocation.miniCenterDocked : null,
      floatingActionButton: Visibility(
        visible: showFab,
        child: FloatingActionButton(
            tooltip: "Action",
            backgroundColor: const Color(0xFF2C3D63),
            onPressed: () {},
            // isExtended: true,
            child: const Icon(Icons.add)),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
