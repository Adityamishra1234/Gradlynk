import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:studentpanel/ui/screen/dashboard/notification.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/drawerfilter.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final String title;
  bool showcase = false;

  @override
  final Size preferredSize;

  CustomAppBar(
    this.title,
    this.showcase, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final GlobalKey _one = GlobalKey();

  final GlobalKey _two = GlobalKey();

  BuildContext? myContext;

  @override
  void initState() {
    try {
      // if (widget.showcase == true) {
      print(widget.showcase);
      ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
        (_) => Future.delayed(const Duration(milliseconds: 200), () {
          ShowCaseWidget.of(myContext!).startShowCase([_one, _two]);
        }),
      );
      // }
    } catch (e) {}
    // Get.find<BaseController>().profiledetail();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myContext = context;
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    return ShowCaseWidget(
        builder: Builder(
            builder: (context) => Padding(
                padding: const EdgeInsets.only(top: 0),
                child: AppBar(
                  elevation: 0,
                  actions: [
                    if (displayMobileLayout == true)
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Get.back(),
                      ),
                    if (displayMobileLayout == false)
                      Showcase(
                        key: _one,
                        description:
                            "Need a help? Quicky raise a ticket at Gradlynk support and in minimal time, query shall be resolved.",
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                            icon: svgImage(
                                "menu", ThemeConstants.IconColor, 35, 35),
                            onPressed: () {
                              DrawerFilter();
                            },
                          ),
                        ),
                      ),
                    svgImage("work", Colors.transparent, 32, 32),

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
                    Showcase(
                      key: _two,
                      description:
                          "The bell rings with an updated notification at your doors.",
                      child: IconButton(
                        icon: svgImage(
                            "notification", ThemeConstants.IconColor, 30, 30),
                        onPressed: () {
                          //TODO
                          Get.to(NotificationScreen());
                        },
                      ),
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
                ))));

    // }));
  }

  //Funcation
  callbacktest(data) {
    print(data);
  }
}
