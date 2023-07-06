import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/customBottomNavbar.dart';

class Settings extends StatelessWidget {
  static const routeNamed = '/Settings';
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomButtomNavbar(currentIndex: 3, context2: context),
      body: Container(
        alignment: Alignment.center,
        child: const Text('Settings'),
      ),
    );
  }
}
