import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class ScrollTabBar extends StatelessWidget {
  static const routeNamed = '/ScrollTabBar';
  final ScrollController _controller = ScrollController();
  final double _height = 100.0;

  ScrollTabBar({super.key});

  void _animateToIndex(int index) {
    _controller.animateTo(
      index * _height,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.double_arrow_rounded),
        onPressed: () => _animateToIndex(10),
      ),
      body: Center(
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              Opacity(
                opacity: 0.5,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: ThemeConstants.bluecolor,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(50.0),
                      )),
                  child: IconButton(
                      onPressed: () {
                        _animateToIndex(1);
                      },
                      icon: const Icon(Icons.keyboard_double_arrow_left_sharp)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  itemCount: 20,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        child: Column(children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: ThemeConstants.whitecolor, side: BorderSide(
                                  color: ThemeConstants.bluegreycolor), backgroundColor: ThemeConstants.whitecolor, // foreground
                            ),
                            onPressed: () {},
                            child: CustomAutoSizeTextMontserrat(text: "Tesst"),
                          ),
                          const SizedBox(
                            height: 40,
                            child: Card(
                              child: Center(child: Text("choose 2")),
                            ),
                          ),
                        ]),
                      ),
                    );
                  },
                ),
              ),
              Opacity(
                opacity: 0.5,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: ThemeConstants.bluecolor,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(50.0),
                      )),
                  child: IconButton(
                      onPressed: () {
                        _animateToIndex(10);
                      },
                      icon: const Icon(Icons.double_arrow_rounded)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
