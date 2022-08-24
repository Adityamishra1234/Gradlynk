import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LunchingPage extends StatelessWidget {
  const LunchingPage({Key? key}) : super(key: key);
  static const routeNamed = '/LunchingPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Image.asset(
          "assets/icons/logogif.gif",
        ),
      ),
    );
  }
}
