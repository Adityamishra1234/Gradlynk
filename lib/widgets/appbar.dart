import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  CustomAppBar(
    this.title, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            color: Color.fromARGB(255, 99, 99, 99),
          ),
          onPressed: () {},
        ),
        SvgPicture.asset(
          "assets/icons/work.svg",
          color: Colors.transparent,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset(
            "assets/images/logo.png",
            width: 150,
            height: 50,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/notification.svg",
            color: Color.fromARGB(255, 99, 99, 99),
            height: 27,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/profile.svg",
            height: 30,
            color: Color.fromARGB(255, 99, 99, 99),
          ),
          onPressed: () {},
        ),
        const SizedBox(
          width: 5,
        )
      ],
      // title: Text(
      //   title,
      //   style: const TextStyle(color: Colors.black),
      // ),
      backgroundColor: Colors.white,
    );
  }
}
