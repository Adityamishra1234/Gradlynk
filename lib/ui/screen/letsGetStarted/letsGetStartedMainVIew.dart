import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/Custom_Tabbar/custom_tabbar.dart';

class LetsGetStartedMainView extends StatelessWidget {
  static const routeNamed = '/letsGetStarted';
  const LetsGetStartedMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBar(
        tabs: [],
      ),
    );
  }
}
