// ignore_for_file: deprecated_member_use

import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../utils/components/notifier_dot.dart';

class PostDetailsActionBtn extends StatelessWidget {
  final String img;
  final Widget? child;
  final bool addbadge;
  final Color? color;
  final double? height;
  final double? width;

  final VoidCallback? onTap;
  const PostDetailsActionBtn({
    super.key,
    required this.img,
    this.onTap,
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
              GestureDetector(
                onTap: onTap,
                child: child ??
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: width ?? 32,
                      height: width ?? 32,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF7F7F7),
                        shape: OvalBorder(),
                      ),
                      child: SizedBox(
                        height: 16,
                        width: 16,
                        child: SvgPicture.asset(
                          'assets/icons/$img',
                          color: color ?? AppColors.kblackColor,
                        ),
                      ),
                    ),
              ),
              const NotifierDot()
            ],
          )
        : GestureDetector(
            onTap: onTap,
            child: child ??
                Container(
                  padding: const EdgeInsets.all(8),
                  width: 32,
                  height: 32,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFF7F7F7),
                    shape: OvalBorder(),
                  ),
                  child: SizedBox(
                    height: 16,
                    width: 16,
                    child: SvgPicture.asset(
                      'assets/icons/$img',
                      color: color ?? AppColors.kblackColor,
                    ),
                  ),
                ),
          );
  }
}
