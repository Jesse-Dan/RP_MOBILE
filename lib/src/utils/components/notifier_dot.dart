import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class NotifierDot extends StatelessWidget {
  const NotifierDot({
    super.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
  });
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right ?? 1,
      top: top ?? 0.1,
      bottom: bottom,
      left: left,
      child: Container(
        width: 9,
        height: 9,
        decoration: ShapeDecoration(
          color: AppColors.kprimaryColor700,
          shape: const OvalBorder(
            side: BorderSide(
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
