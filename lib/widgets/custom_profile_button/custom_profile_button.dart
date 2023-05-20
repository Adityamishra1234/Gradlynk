import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studentpanel/utils/theme.dart';

class CustomProfileButton extends StatefulWidget {
  final int isCompleted;
  String title;
  CustomProfileButton(
      {super.key, required this.isCompleted, required this.title});

  @override
  State<CustomProfileButton> createState() => _CustomProfileButtonState();
}

class _CustomProfileButtonState extends State<CustomProfileButton> {
  /// 0 - no 1 - half 2 - not opened

  @override
  Widget build(BuildContext context) {
    return
        //  Container(
        //   padding: EdgeInsets.all(15),
        //   constraints: BoxConstraints(minWidth: 140, maxWidth: 150, minHeight: 65),
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //       border: Border.all(
        //           width: widget.isCompleted == 1 ? 1 : 1,
        //           color: widget.isCompleted == 1
        //               ? ThemeConstants.orangeColor
        //               : widget.isCompleted == 2
        //                   ? ThemeConstants.blackcolor
        //                   : Colors.transparent),
        //       color: widget.isCompleted == 0
        //           ? ThemeConstants.bluecolor
        //           : widget.isCompleted == 1
        //               ? ThemeConstants.lightOrangeColor
        //               : ThemeConstants.skinColour,
        //       borderRadius: BorderRadius.circular(15)),
        //   child: Row(
        //       mainAxisAlignment: widget.isCompleted == 2
        //           ? MainAxisAlignment.center
        //           : MainAxisAlignment.spaceBetween,
        //       children: [
        //         Flexible(
        //           child: Text(
        //             "${widget.title}",
        //             style: TextStyle(
        //                 color: widget.isCompleted == 0
        //                     ? ThemeConstants.whitecolor
        //                     : ThemeConstants.blackcolor),
        //           ),
        //         ),
        //         widget.isCompleted == 0
        //             ? Icon(
        //                 Icons.check_circle_outline,
        //                 color: ThemeConstants.whitecolor,
        //               )
        //             : widget.isCompleted == 1
        //                 ? Icon(
        //                     Icons.error_outline_rounded,
        //                     color: ThemeConstants.orangeColor,
        //                   )
        //                 : SizedBox.shrink(),

        //         // Icon(widget.isCompleted == 0
        //         //     ? Icons.check
        //         //     : widget.isCompleted == 1
        //         //         ? Icons.error_outline_rounded
        //         //         : null)
        //       ]),
        // );
        Container(
      padding: EdgeInsets.all(15),
      constraints: BoxConstraints(minWidth: 140, maxWidth: 150, minHeight: 65),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
              width: widget.isCompleted == 1 ? 1 : 1,
              color: widget.isCompleted == 1
                  ? ThemeConstants.blackcolor
                  : Color.fromARGB(131, 77, 77, 77)),
          color: widget.isCompleted == 1
              ? ThemeConstants.bluecolor
              : ThemeConstants.whitecolor,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
          mainAxisAlignment: widget.isCompleted == 0
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "${widget.title}",
                style: TextStyle(
                    color: widget.isCompleted == 1
                        ? ThemeConstants.whitecolor
                        : ThemeConstants.blackcolor),
              ),
            ),
            widget.isCompleted == 1
                ? Icon(
                    Icons.check_circle_outline,
                    color: ThemeConstants.whitecolor,
                  )
                : SizedBox.shrink(),

            // Icon(widget.isCompleted == 0
            //     ? Icons.check
            //     : widget.isCompleted == 1
            //         ? Icons.error_outline_rounded
            //         : null)
          ]),
    );
  }
}
