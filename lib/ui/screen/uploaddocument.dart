import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UploadDocument extends StatelessWidget {
  const UploadDocument({Key? key}) : super(key: key);
  static const routeNamed = '/UploadDocument';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Text("Upload Document"),
      ),
    );
  }
}
