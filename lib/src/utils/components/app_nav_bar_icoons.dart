
import 'package:flutter/material.dart';

class AppNavBarIcon extends StatefulWidget {
  final String img;
  final String selectedImg;
  final VoidCallback? onTap;
  final int currentIndex;
  final int value;

  const AppNavBarIcon(
      {super.key,
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
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Image.asset(
          'assets/icons/${widget.currentIndex == widget.value ? widget.selectedImg : widget.img}',
          height: 40,
          width: 62,
        ),
      ),
    );
  }
}
