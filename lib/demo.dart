import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/pdfview.dart';
class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}


class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextButton(child: Text("pick file"),onPressed:() async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          if (result != null) {
            File file = File(result.files.single.path!);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage(file:file)),
            );
          } else {
            // User canceled the picker
          }
        },),
      ),
    );
  }
}
