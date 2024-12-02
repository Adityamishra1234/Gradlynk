import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:studentpanel/utils/theme.dart';

class CustomShimmer extends StatefulWidget {
  Widget bodyWidget;
  bool? loading = true;

  CustomShimmer({super.key, required this.bodyWidget, this.loading});

  @override
  State<CustomShimmer> createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer> {
  @override
  Widget build(BuildContext context) {
    return widget.loading == true
        ? Shimmer.fromColors(
            baseColor: ThemeConstants.lightblueColor,
            highlightColor: ThemeConstants.lightblueColor2,
            enabled: true,
            child: widget.bodyWidget,
          )
        : widget.bodyWidget;
  }
}
