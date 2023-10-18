import 'package:flutter/material.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomLoadingButton extends StatefulWidget {
  String buttonName;
  double? width;
  double? height;
  dynamic Function(Function, Function, ButtonState) onTap;
  CustomLoadingButton(
      {super.key,
      required this.buttonName,
      required this.onTap,
      this.height,
      this.width});

  @override
  State<CustomLoadingButton> createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton> {
  @override
  Widget build(BuildContext context) {
    return LoadingButton(
        height: widget.height ?? 35,
        borderRadius: 8,
        animate: true,
        color: Colors.indigo,
        width: widget.width ?? 120,
        loader: Container(
          padding: const EdgeInsets.all(10),
          width: 30,
          height: 30,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        onTap: widget.onTap,
        child: CustomAutoSizeTextMontserrat(
          text: widget.buttonName,
          textColor: ThemeConstants.whitecolor,
        ));
  }
}
