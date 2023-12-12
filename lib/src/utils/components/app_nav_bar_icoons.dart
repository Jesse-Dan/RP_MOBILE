import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import 'notifier_dot.dart';

class AppNavBarIcon extends StatefulWidget {
  final String img;
  final String selectedImg;
  final VoidCallback? onTap;
  final int currentIndex;
  final int value;
  final bool addbadge;

  const AppNavBarIcon(
      {super.key,
      this.addbadge = false,
      required this.img,
      required this.selectedImg,
      this.onTap,
      required this.currentIndex,
      required this.value});

  @override
  State<AppNavBarIcon> createState() => _AppNavBarIconState();
}

class _AppNavBarIconState extends State<AppNavBarIcon> {
  @override
  Widget build(BuildContext context) {
    return (widget.addbadge)
        ? Expanded(
            child: GestureDetector(
              onTap: widget.onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/icons/${widget.currentIndex == widget.value ? widget.selectedImg : widget.img}',
                        height: 40,
                        width: 62,
                      ),
                      const NotifierDot( right: 18,
                        top: 1,)
                    ],
                  ),
                ],
              ),
            ),
          )
        : Expanded(
            child: GestureDetector(
              onTap: widget.onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/${widget.currentIndex == widget.value ? widget.selectedImg : widget.img}',
                    height: 40,
                    width: 62,
                  ),
                ],
              ),
            ),
          );
  }
}
