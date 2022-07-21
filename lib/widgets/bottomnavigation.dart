import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 60,
              width: 50,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 15),
                    child: SizedBox(
                      height: 46,
                      width: 50,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset("assets/icons/profile.svg",
                                color: Colors.blueGrey,
                                height: 30,
                                width: 30,
                                semanticsLabel: 'A red up arrow'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              width: 80,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: SizedBox(
                      height: 46,
                      width: 80,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset("assets/icons/profile.svg",
                                color: Colors.blueGrey,
                                height: 30,
                                width: 30,
                                semanticsLabel: 'A red up arrow'),

                            const Text("Customers"), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              width: 80,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 40),
                    child: SizedBox(
                      height: 46,
                      width: 50,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset("assets/icons/profile.svg",
                                color: Colors.blueGrey,
                                height: 30,
                                width: 30,
                                semanticsLabel: 'A red up arrow'),

                            const Text("Khata"), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              width: 80,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      height: 46,
                      width: 50,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset("assets/icons/profile.svg",
                                color: Colors.blueGrey,
                                height: 30,
                                width: 30,
                                semanticsLabel: 'A red up arrow'),

                            const Text("Order"), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
