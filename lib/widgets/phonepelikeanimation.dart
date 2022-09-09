import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:phlox_animations/phlox_animations.dart';

class AnimationaPhonepe extends StatefulWidget {
  const AnimationaPhonepe({Key? key}) : super(key: key);
  static const routeNamed = '/AnimationalPhonepe';

  @override
  State<AnimationaPhonepe> createState() => _AnimationaPhonepeState();
}

class _AnimationaPhonepeState extends State<AnimationaPhonepe>
    with SingleTickerProviderStateMixin {
  bool showFab = false;
  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Test"),
      // ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          setState(() {
            if (notification.direction == ScrollDirection.forward) {
              showFab = false;
            } else if (notification.direction == ScrollDirection.reverse) {
              showFab = true;
            }
          });
          return true;
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: ListView.builder(
                itemCount: 200,
                //   controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile();
                },
              ),
            ),
            if (showFab == false)
              Positioned(
                bottom: 40,
                left: 220,
                child: PhloxAnimations(
                  duration: const Duration(milliseconds: 1000),
                  toX: -50,
                  fromX: -50,
                  toY: -40,
                  fromY: -20,
                  loop: true,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade900, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),

                  /// add **Loop**
                ),
              ),
          ],
        ),
      ),
      // floatingActionButton: showFab
      //     ? FloatingActionButton(
      //         child: Icon(Icons.keyboard_arrow_down),
      //         onPressed: () {
      //           _scrollController
      //               .jumpTo(_scrollController.position.maxScrollExtent);
      //         },
      //       )
      //     : null,
    );
  }
}
