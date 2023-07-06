import 'package:flutter/material.dart';

class CustomCircularProgress {
  /// function how to build custum circular
  static show(BuildContext context,
      {double size = 40,
      double elevation = 2.0,
      double strokeWidth = 1,
      double? value,
      Color? backgroundColor,
      Animation<Color>? valueColor,
      double,
      String? semanticsLabel,
      String? semanticsValue}) {
    return Container(
      /// heigth = width because we nedd to have a circle with same dimension
      height: size,
      width: size,
      margin: const EdgeInsets.all(5),
      child: Center(
        /// Material because we need to have type and elevation for build the circle based widget
        child: Material(
          type: MaterialType.circle,
          color: Theme.of(context).canvasColor,
          elevation: elevation,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              backgroundColor: backgroundColor,
              semanticsLabel: semanticsLabel,
              semanticsValue: semanticsValue,
              value: value,
              valueColor: valueColor,
            ),
          ),
        ),
      ),
    );
  }
}
