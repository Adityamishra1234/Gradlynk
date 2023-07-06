import 'dart:async';

import 'package:flutter/material.dart';

class LinearProgressIndicatorApp extends StatefulWidget {
  const LinearProgressIndicatorApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return LinearProgressIndicatorAppState();
  }
}

class LinearProgressIndicatorAppState
    extends State<LinearProgressIndicatorApp> {
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: _loading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LinearProgressIndicator(
                  backgroundColor: Colors.cyanAccent,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                  value: _progressValue,
                ),
                Text('${(_progressValue * 100).round()}%'),
              ],
            )
          : const Text("Press button for downloading",
              style: TextStyle(fontSize: 25)),
    );
  }

  // this function updates the progress value
  void _updateProgress() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.1;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          return;
        }
      });
    });
  }
}
