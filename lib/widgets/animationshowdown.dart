import 'package:flutter/material.dart';
import 'package:phlox_animations/phlox_animations.dart';

class AnimationShowDownArror extends StatefulWidget {
  int? xdata = -50;
  int? toY = -40;
  int? fromY = -20;
  AnimationShowDownArror({Key? key, this.fromY, this.toY, this.xdata})
      : super(key: key);

  @override
  State<AnimationShowDownArror> createState() => _AnimationShowDownArrorState();
}

class _AnimationShowDownArrorState extends State<AnimationShowDownArror> {
  int? xdata;
  int? toY;
  int? fromY;

  @override
  void initState() {
    xdata = widget.xdata;
    toY = widget.toY;
    fromY = widget.fromY;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PhloxAnimations(
      duration: const Duration(milliseconds: 1000),
      toX: xdata != null ? (xdata! * 1.00) : -50,
      fromX: xdata != null ? (xdata! * 1.00) : -50,
      toY: toY != null ? (toY! * 1.0) : -40,
      fromY: fromY != null ? (fromY! * 1.0) : -20,
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
    );
  }
}
