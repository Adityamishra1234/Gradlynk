import 'package:flutter/material.dart';

class CourseSearch extends StatelessWidget {
  CourseSearch({Key? key}) : super(key: key);
  static const routeNamed = '/CourseSearch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Course Search")),
      ),
    );
  }
}
