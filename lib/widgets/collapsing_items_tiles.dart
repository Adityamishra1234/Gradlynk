import 'package:studentpanel/utils/theme.dart';
import 'package:flutter/material.dart';

class CollapsingItemTiles extends StatefulWidget {
  final String? title;
  final AnimationController? animationController;
  final IconData? icon;
  final bool? isSelected;
  final VoidCallback? onTap;

  const CollapsingItemTiles(
      {Key? key,
      this.onTap,
      this.animationController,
      required this.title,
      required this.icon,
      this.isSelected = false})
      : super(key: key);

  @override
  _CollapsingItemTilesState createState() => _CollapsingItemTilesState();
}

class _CollapsingItemTilesState extends State<CollapsingItemTiles> {
  late Animation<double> _widthAnimation;
  late Animation<double> _sizedBoxAnimation;

  @override
  void initState() {
    _widthAnimation =
        Tween<double>(begin: 250, end: 70).animate(widget.animationController!);
    _sizedBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.isSelected!
                ? Colors.transparent.withOpacity(.5)
                : Colors.transparent),
        width: _widthAnimation.value,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              size: 30,
              color: widget.isSelected!
                  ? ThemeConstants.selectedColor
                  : Colors.white30,
            ),
            SizedBox(width: _sizedBoxAnimation.value),
            _widthAnimation.value > 220
                ? Text(
                    widget.title!,
                    style: widget.isSelected!
                        ? ThemeConstants.selectedTextStyle
                        : ThemeConstants.defaultTextStyle,
                  )
                : const Offstage()
          ],
        ),
      ),
    );
  }
}
