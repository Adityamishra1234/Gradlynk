import 'package:flutter/material.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class UpcomingEvent extends StatelessWidget {
  List<UpcomingEventModel>? model = [];
  UpcomingEvent({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> addWidget = [];
    for (var i = 0; i < model!.length; i++) {
      addWidget.add(Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          decoration: BoxDecoration(
              color: ThemeConstants.whitecolor,
              border: Border.all(color: const Color(0xFFE5E1FE)),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              children: [
                CustomAutoSizeTextMontserrat(
                  text: model![i].campaignName,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    svgImage("calender", ThemeConstants.orangeColor, 15, 15),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: model![i].campaignDate!.split(" -")[0],
                      textColor: ThemeConstants.orangeColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ));
    }
    return Scaffold(
      appBar: CustomAppBar("title"),
      drawer: const
       
       
        
         
           CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  svgImage("calender", const Color(0xFF6F61FF), 25, 25),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Upcoming Events",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ],
              ),
            ),
            ...addWidget
          ],
        ),
      ),
    );
  }
}
