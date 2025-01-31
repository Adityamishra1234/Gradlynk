import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';

typedef StringCallback = void Function(String val);

class CustomTimerWidget2withButton extends StatefulWidget {
  final StringCallback callback;

  const CustomTimerWidget2withButton({Key? key, required this.callback})
      : super(key: key);

  @override
  State<CustomTimerWidget2withButton> createState() =>
      _CustomTimerWidget2withButtonState();
}

class _CustomTimerWidget2withButtonState
    extends State<CustomTimerWidget2withButton> {
  String finaldate = '${DateTime.now().hour}:${DateTime.now().minute}';
  String date = '${DateTime.now().hour}:${DateTime.now().minute}';
  String previousDate = '${DateTime.now().hour}:${DateTime.now().minute}';
  String dateToShow = '${DateTime.now().hour}:${DateTime.now().minute}';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   finaldate = '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  //   date = '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  //   previousDate = '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  //   dateToShow = '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  //
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext builder) {
              return Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 30, right: 30),
                height: MediaQuery.of(context).copyWith().size.height / 3,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              dateToShow = previousDate;
                              Navigator.pop(context);
                              widget.callback(dateToShow);
                            });
                          },
                          child: const Text('Cancel'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              previousDate = date;
                              date = dateToShow;
                              widget.callback(date);
                            });
                          },
                          child: const Text('Done'),
                        ),
                      ],
                    ),
                    Expanded(
                      child: CupertinoDatePicker(
                        use24hFormat: true,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime newdate) {
                          setState(() {
                            dateToShow = '${newdate.hour}:${newdate.minute}';
                          });
                          widget.callback(dateToShow);
                        },
                        // maximumDate: DateTime(2025, 12, 30),
                        // minimumYear: 2010,
                        // maximumYear: 2035,
                        minuteInterval: 1,
                        mode: CupertinoDatePickerMode.time,
                      ),
                    )
                  ],
                ),
              );
            }).whenComplete(() {
          setState(() {
            previousDate = date;
            date = dateToShow;

            widget.callback(dateToShow);
          });
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: ThemeConstants.bluecolor, width: 3),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dateToShow, style: const TextStyle(fontSize: 20)),
            const Icon(Icons.access_time)
          ],
        ),
      ),
    );
  }
}
