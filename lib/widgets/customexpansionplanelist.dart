import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomExpansionPlanList extends StatefulWidget {
  String? titel;
  String? text;
  CustomExpansionPlanList({Key? key, this.titel, this.text}) : super(key: key);

  @override
  State<CustomExpansionPlanList> createState() =>
      _CustomExpansionPlanListState();
}

class _CustomExpansionPlanListState extends State<CustomExpansionPlanList> {
  String? title;
  String? text;
  @override
  void initState() {
    title = widget.titel;
    text = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = MediaQuery.of(context).size.width - 240;
    }
    return Card(
      elevation: 0,
      child: ConfigurableExpansionTile(
        header: (isExpanded, iconTurns, heightFactor) {
          return Flexible(
            child: SizedBox(
              // width: width - 10,
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomAutoSizeTextMontserrat(
                      text: title,
                      textColor: ThemeConstants.bluecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          );
        },
        childrenBody: Column(
          children: [
            // Check Box
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: HtmlWidget(
                text!,
                textStyle: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: ThemeConstants.TextColor,
                  fontSize: 14.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
