import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/time_picker.dart';

class TimepickerDemo extends StatelessWidget {
  const TimepickerDemo({super.key});
  static const routeNamed = '/TimepickerDemo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TimePickerExample(
          callbackDate: callback,
          enableField: false,
          date: "12-02-00",
        ),
      ),
    );

    // callback
  }

  callback(data) {
    print(data);
  }
}
