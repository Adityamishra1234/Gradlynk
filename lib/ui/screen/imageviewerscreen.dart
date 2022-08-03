import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageViewerScreen extends StatelessWidget {
  const ImageViewerScreen({Key? key}) : super(key: key);
  static const routeNamed = '/ImageViewerScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: 50,
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.white,
                        ],
                        begin: FractionalOffset.centerLeft,
                        end: FractionalOffset.centerRight,
                        tileMode: TileMode.repeated)),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
            ),
            InteractiveViewer(
              child: Image.asset(
                "assets/images/otp.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            )
          ],
        ),
      ),
    );
  }
}
