import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/widgets/customexpansiontile.dart';
import 'package:studentpanel/widgets/multiselectdialog.dart';

class DrawerFilter extends StatelessWidget {
  DrawerFilter({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  // final _items = _data.map((data) => MultiSelectItem(data, data)).toList();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 220,
        child: ListView(controller: ScrollController(), children: [
          //University Name
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomMultiSelectDialog(
              data: const ["1", "2", "3"],
              title: "University Name",
            ),
          ),
          // Intake Month

          CustomExpansiontile(
            title: "Intake Month",
            data: const ["a", "b", "c"],
          ),
          // Intake year
          CustomExpansiontile(
            title: "Intake Year",
            data: const ["a", "b", "c"],
          ),
          //Insitute- public/private
          CustomExpansiontile(
            title: "Insitute - public/private",
            data: const ["a", "b", "c"],
          ),
          //Insitute-Level
          CustomExpansiontile(
            title: "Insitute-Level",
            data: const ["a", "b", "c"],
          ),
          // Academic Percentage
          CustomExpansiontile(
            title: "Academic Percentage",
            data: const ["a", "b", "c"],
          ),
          // Budget
          CustomExpansiontile(
            title: "Budget",
            data: const ["a", "b", "c"],
          ),
          // Scholarship
          CustomExpansiontile(
            title: "Scholarship",
            data: const ["a", "b", "c"],
          ),
          //Siec Priority
          CustomExpansiontile(
            title: "Siec Priority",
            data: const ["a", "b", "c"],
          ),
          // Conditional Offer
          CustomExpansiontile(
            title: "Conditional Offer",
            data: const ["a", "b", "c"],
          ),
          // Backlog Acceptable
          CustomExpansiontile(
            title: "Backlog Acceptable",
            data: const ["a", "b", "c"],
          ),
          // Application Fee
          CustomExpansiontile(
            title: "Application Fee",
            data: const ["a", "b", "c"],
          ),
          // Off TAT(In Days)
          CustomExpansiontile(
            title: "Off TAT(In Days)",
            data: const ["a", "b", "c"],
          ),
          //Visa TAT(In days)
          CustomExpansiontile(
            title: "Visa TAT(In days)",
            data: const ["a", "b", "c"],
          ),
          // Placement/Sandwich year
          CustomExpansiontile(
            title: "Placement/Sandwich year",
            data: const ["a", "b", "c"],
          ),
          // Siec Represented
          CustomExpansiontile(
            title: "Siec Represented",
            data: const ["a", "b", "c"],
          ),
          // Country Name
          Padding(
            padding: const EdgeInsets.only(),
            child: CustomMultiSelectDialog(
              data: const ["1", "2", "3"],
              title: "Country Name",
            ),
          ),
          // Select Ranking
          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: ConfigurableExpansionTile(
              header: SizedBox(
                width: 220,
                height: 40,
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Select Ranking",
                        style: Constants.textstyle,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              children: [
                // Check Box
                CustomMultiSelectDialog(
                  data: const ["1", "2", "3"],
                  title: "Ranking",
                ),
                CustomMultiSelectDialog(
                  data: const ["1", "2", "3"],
                  title: "Starting Ranking",
                ),
                CustomMultiSelectDialog(
                  data: const ["1", "2", "3"],
                  title: "End Ranking",
                ),
              ],
            ),
          ),
        ]));
  }
}
