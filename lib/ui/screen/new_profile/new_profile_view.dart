import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewProfileView extends StatefulWidget {
  const NewProfileView({super.key});

  @override
  State<NewProfileView> createState() => _NewProfileViewState();
}

class _NewProfileViewState extends State<NewProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: const [
            FractionallySizedBox(
              heightFactor: 0.4,
              alignment: Alignment.topCenter,
            ),
            FractionallySizedBox(
              heightFactor: 0.6,
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    );
  }
}
