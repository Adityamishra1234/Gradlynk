import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 60,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SizedBox(
                      height: 50,
                      width: 60,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset("assets/icons/home.svg",
                                color:
                                    //  false
                                    //     ? Color(0xFF677082)
                                    //     :
                                    Color(0xFF1940B3),
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
              height: 50,
              width: 60,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 46,
                      width: 60,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset("assets/icons/messanger.svg",
                                color: Color(0xFF677082),
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
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 5),
              child: CustomAutoSizeTextMontserrat(
                text: "Join SVO link",
                maxLines: 1,
                textColor: Color(0xFF1940B3),
                fontSize: 13,
              ),
            )),
            SizedBox(
              height: 50,
              width: 60,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 46,
                      width: 60,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset("assets/icons/enqiry.svg",
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
              height: 50,
              width: 60,
              child: Column(
                children: [
                  SizedBox(
                    height: 46,
                    width: 50,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset("assets/icons/profile-bottom.svg",
                              color: Color(0xFF677082),
                              height: 30,
                              width: 30,
                              semanticsLabel: 'A red up arrow'),
                        ],
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
