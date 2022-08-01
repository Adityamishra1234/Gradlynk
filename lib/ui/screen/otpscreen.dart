import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);
  static const routeNamed = '/Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color(0xFF1940B3)),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    const Spacer(),
                    CustomAutoSizeTextMontserrat(
                      text: "aman",
                      maxLines: 1,
                      textColor: Colors.white,
                      fontSize: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 2),
                      child: Image.asset(
                        "assets/images/logow.png",
                        height: 45,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: SizedBox(
                          height: 10,
                          child: GetBuilder<LoginController>(
                              builder: (_) => Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: _.currentindex.value == 0
                                            ? Colors.white
                                            : Colors.grey,
                                        size:
                                            _.currentindex.value == 0 ? 11 : 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Icon(
                                          Icons.circle,
                                          color: _.currentindex.value == 1
                                              ? Colors.white
                                              : Colors.grey,
                                          size: _.currentindex.value == 1
                                              ? 11
                                              : 8,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Icon(
                                          Icons.circle,
                                          color: _.currentindex.value == 2
                                              ? Colors.white
                                              : Colors.grey,
                                          size: _.currentindex.value == 2
                                              ? 11
                                              : 8,
                                        ),
                                      ),
                                    ],
                                  ))),
                    ),
                  ),
                  const Spacer()
                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                heightFactor: 1.1,
                child: Container(
                  height: 240,
                  width: 355,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Enter your phone number",
                              fillColor: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: 55,
                          width: 315,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF1940B3),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                              onPressed: () {},
                              child: CustomAutoSizeTextMontserrat(
                                text: "Send OTP",
                                maxLines: 1,
                                textColor: Colors.white,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
