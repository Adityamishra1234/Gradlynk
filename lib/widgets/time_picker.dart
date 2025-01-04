import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class TimePickerExample extends StatefulWidget {
  final Function callbackDate;
  String? date;
  bool enableField;

  TimePickerExample(
      {Key? key,
      required this.enableField,
      this.date,
      required this.callbackDate})
      : super(key: key);

  @override
  State<TimePickerExample> createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  Duration duration = const Duration(hours: 0, minutes: 00);
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

  String formatDurationInHhMmSs(Duration duration) {
    final HH = (duration.inHours).toString().padLeft(2, '0');
    final mm = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final ss = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$HH hours- $mm min- $ss sec';
  }

  @override
  Widget build(BuildContext context) {
    return widget.enableField == false
        ? DefaultTextStyle(
            style: TextStyle(
              color: CupertinoColors.label.resolveFrom(context),
              fontSize: 22.0,
            ),
            child: Container(
              // height: 60,
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                  // color: ThemeConstants.lightblueColor,
                color: ThemeConstants.whitecolor,border: Border(bottom: BorderSide(color: ThemeConstants.blackcolor)),
                  // borderRadius: const BorderRadius.all(Radius.circular(15.0))
              ),
              child: CupertinoButton(
                  // Display a CupertinoDatePicker in date picker mode.
                  onPressed: () => _showDialog(
                        CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.hms,
                          initialTimerDuration: duration,
                          // This is called when the user changes the timer's
                          // duration.
                          onTimerDurationChanged: (Duration newDuration) {
                            setState(() {
                              duration = newDuration;
                              widget.callbackDate(newDuration);
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
                          ? "00-00-00"
                          : formatDurationInHhMmSs(duration),
                      fontSize: 16,
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
                    ? "00-00-00"
                    : formatDurationInHhMmSs(duration),
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
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
