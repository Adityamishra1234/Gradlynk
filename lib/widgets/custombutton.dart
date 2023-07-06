import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.text,
      this.backgroundColor = Colors.red,
      required this.onPressed,
      this.horizontelPadding})
      : super(key: key);

  final String text;
  final Color backgroundColor;
  double? horizontelPadding;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                  offset: Offset.fromDirection(90))
            ]),
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(
            horizontal: horizontelPadding ?? 16, vertical: 8),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
