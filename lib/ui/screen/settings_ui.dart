import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studentpanel/widgets/customBottomNavbar.dart';

class Settings extends StatelessWidget {
  static const routeNamed = '/Settings';
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtomNavbar(currentIndex: 3),
      body: Container(
        alignment: Alignment.center,
        child: Text('Settings'),
      ),
    );
  }
}
