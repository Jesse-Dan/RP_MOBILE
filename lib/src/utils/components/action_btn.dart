// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'notifier_dot.dart';

class ActionBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String imgUrl;
  final Widget? child;
  final bool addbadge;
  final Color? color;
  final double? height;
  final double? width;

  const ActionBtn({
    super.key,
    this.onPressed,
    required this.imgUrl,
    this.child,
    this.addbadge = false,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return addbadge
        ? Stack(
            children: [
              InkWell(
                onTap: onPressed,
                child: child ??
                    SvgPicture.asset(
                      color: color,
                      'assets/icons/$imgUrl',
                      height: height ?? 24,
                      width: width ?? 24,
                    ),
              ),
              const NotifierDot()
            ],
          )
        : InkWell(
            onTap: onPressed,
            child: child ??
                SvgPicture.asset(
                  'assets/icons/$imgUrl',
                  height: 24,
                  width: 24,
                  color: color,
                ),
          );
  }
}
