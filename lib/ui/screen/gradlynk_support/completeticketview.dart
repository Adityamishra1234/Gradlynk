import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/ticketdatamodel.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CompleteTicketView extends StatelessWidget {
  Data model = Data();
  CompleteTicketView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('title'),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAutoSizeTextMontserrat(
              text:
                  "Ticket Raised By ${Get.find<BaseController>().model1.enquiryName}",
              fontSize: 20,
              textColor: ThemeConstants.bluecolor,
              fontWeight: FontWeight.w800,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomAutoSizeTextMontserrat(
              text: model.issue,
              textColor: ThemeConstants.bluecolor,
            ),
            CustomAutoSizeTextMontserrat(
              text: model.createdAt!.split("T")[0],
              textColor: ThemeConstants.TextColor,
            ),
            if (model.firstComment != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomAutoSizeTextMontserrat(
                  text: "Gradlynk Support",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  textColor: ThemeConstants.blackcolor,
                ),
              ),
            if (model.firstComment != null)
              CustomAutoSizeTextMontserrat(
                text: model.firstComment,
                textColor: ThemeConstants.TextColor,
              ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomAutoSizeTextMontserrat(
                text: "Attachments",
                textColor: ThemeConstants.TextColor,
              ),
            ),
            Row(
              children: [
                if (model.documentName1 != null)
                  SizedBox(
                      height: 200,
                      width: 100,
                      child: Image.network(model.documentName1!)),
                const SizedBox(
                  width: 10,
                ),
                if (model.documentName2 != null)
                  SizedBox(
                      height: 200,
                      width: 100,
                      child: Image.network(model.documentName2!)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
