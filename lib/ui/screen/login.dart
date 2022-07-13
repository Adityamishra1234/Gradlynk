import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFDEE6FF),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Center(
                    child: Image.asset(
                      "assets/images/loginbanner.png",
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width * 0.80,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                          child: Image.asset(
                            'assets/images/s2clogo.png',
                            height: 70,
                            width: 200,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: Center(
                          child: Text(
                            "GET STARTED",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        labelStyle: TextStyle(color: Color(0xFF424242)),
                        hintText: 'example@gmail.com'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        labelStyle: TextStyle(color: Color(0xFF424242)),
                        hintText: 'Password'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, top: 20),
                    child: SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (email != null && password != null) {
                            UserModel model = await Get.put(LoginController())
                                .Login(email.toString(), password.toString());
                            Get.to(DashBoard(
                              model: model,
                            ));
                          } else {
                            Get.defaultDialog(
                                content: const Text(
                                    "Please Check your Email and Password "),
                                confirm: TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("Ok")));
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text(
                            //         "This is a normal SnackBar using Context"),
                            //   ),
                            // );
                            // Get.snackbar("", "Please check Email and password ",
                            //     snackPosition: SnackPosition.BOTTOM);
                            // const GetSnackBar(
                            //   message: "Aman soni  ",
                            //   messageText: Text("data"),
                            //  );
                            // Get.showSnackbar("aman")
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF1A42BA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(100, 40),
                        ),
                        child: const Text("LogIn"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
