import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

class DrawerFilter extends StatelessWidget {
  const DrawerFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          ExpandedTileList.builder(
              itemCount: 3,
              maxOpened: 2,
              reverse: true,
              itemBuilder: (context, index, controller) {
                return ExpandedTile(
                    title: Text("choose1"),
                    content: Text("choose1"),
                    controller: controller);
              }),
        ],
      ),
    );
  }
}
