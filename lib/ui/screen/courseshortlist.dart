import 'package:flutter/material.dart';

class CourseShortList extends StatelessWidget {
  const CourseShortList({Key? key}) : super(key: key);
  static const routeNamed = '/CourseShortList';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Course ShortList"),
      ),
    );
  }
}
