import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class DocumentCheckList extends StatefulWidget {
  const DocumentCheckList({Key? key}) : super(key: key);

  @override
  State<DocumentCheckList> createState() => _DocumentCheckListState();
}

class _DocumentCheckListState extends State<DocumentCheckList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [CustomAutoSizeTextMontserrat(text: "DocumentCheckListState")],
    ));
  }
}
