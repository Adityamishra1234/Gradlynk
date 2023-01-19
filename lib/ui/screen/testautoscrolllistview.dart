import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class TestAutoScrollListView extends StatefulWidget {
  static const routeNamed = '/TestAutoScrollListView';

  const TestAutoScrollListView({Key? key}) : super(key: key);
  @override
  _TestAutoScrollListViewState createState() => _TestAutoScrollListViewState();
}

class _TestAutoScrollListViewState extends State<TestAutoScrollListView> {
  final scrollDirection = Axis.horizontal;

  AutoScrollController controller = AutoScrollController();
  List<List<int>>? randomList;

  List<String>? listProgressName = [
    "Application Documnentation (Preparation)",
    "Applicationa Validation By Branch Team",
    "Applicationa Validation By Central Team",
    "Submit to university"
  ];

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    _scrollToIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: SizedBox(
        height: 70,
        child: ListView(
          scrollDirection: scrollDirection,
          controller: controller,
          children: <Widget>[
            ...List.generate(4, (index) {
              return AutoScrollTag(
                  key: ValueKey(index),
                  controller: controller,
                  index: index,
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeConstants.GreenColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            "assets/icons/submit.svg",
                            color: ThemeConstants.whitecolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 190,
                        child: CustomAutoSizeTextMontserrat(
                            textColor: ThemeConstants.GreenColor,
                            fontWeight: FontWeight.bold,
                            text: listProgressName![index]),
                      ),
                      CustomAutoSizeTextMontserrat(
                        text: "___     ",
                        textColor: ThemeConstants.lightgreycolor,
                      ),
                    ],
                  ));
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToIndex,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future _scrollToIndex() async {
    await controller.scrollToIndex(2, preferPosition: AutoScrollPosition.begin);
  }
}
