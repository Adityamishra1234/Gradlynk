import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/widgets/multiselectdropdown.dart';

class TestTest extends StatelessWidget {
  const TestTest({Key? key}) : super(key: key);
  static const routeNamed = '/Test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MultiSelectDropDown(
            title: "Test",
            listdata: ["1", "2", "3"],
          ),
        ),
      ),
    );
  }
}
