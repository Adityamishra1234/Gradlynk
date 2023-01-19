import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class DatePickerExample extends StatefulWidget {
  final Function callbackDate;
  String? date;
  bool enableField;

  DatePickerExample(
      {Key? key,
      required this.enableField,
      this.date,
      required this.callbackDate})
      : super(key: key);

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  bool dateFormatError = false;
  DateTime date = DateTime(2016, 10, 26);

  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    dateFormatError = false;
    DateTime now = new DateTime.now();
    if (getNUllChecker(widget.date) == false) {
      List<String> temp = widget.date!.split('-');
      date =
          DateTime(int.parse(temp[0]), int.parse(temp[1]), int.parse(temp[2]));
      if (date.year == -1) {
        dateFormatError = true;
        date = date = DateTime(now.year, now.month, now.day);
      }
    } else {
      date = DateTime(now.year, now.month, now.day);
    }
    return widget.enableField == false
        ? DefaultTextStyle(
            style: TextStyle(
              color: CupertinoColors.label.resolveFrom(context),
              fontSize: 22.0,
            ),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                  color: ThemeConstants.lightblueColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              child: CupertinoButton(
                  // Display a CupertinoDatePicker in date picker mode.
                  onPressed: () => _showDialog(
                        CupertinoDatePicker(
                          initialDateTime: date,
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          // This is called when the user changes the date.
                          onDateTimeChanged: (DateTime newDate) {
                            setState(() {
                              dateFormatError = false;
                              date = newDate;
                              widget.callbackDate(newDate);
                            });
                          },
                        ),
                      ),
                  // In this example, the date is formatted manually. You can
                  // use the intl package to format the value based on the
                  // user's locale settings.
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(
                      text: dateFormatError == true
                          ? "0000-00-00"
                          : '${date.year}-${date.month}-${date.day}',
                      fontSize: 14,
                    ),
                  )),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(),
            child: TextField(
              maxLines: 1,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              readOnly: true,
              decoration: InputDecoration(
                hintText: dateFormatError == true
                    ? "0000-00-00"
                    : '${date.year}-${date.month}-${date.day}',
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle2,
            ),
          );
  }
}

// This class simply decorates a row of widgets.
class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: ThemeConstants.lightblueColor,
            borderRadius: const BorderRadius.all(Radius.circular(15.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      ),
    );
  }
}
