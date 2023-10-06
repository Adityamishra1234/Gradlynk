import 'package:flutter/material.dart';

class CircleContainerWithIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final Function()? onPress;

  const CircleContainerWithIcon(
      {required this.icon,
      required this.color,
      required this.size,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Icon(icon, size: size / 2),
        ),
      ),
    );
  }
}
