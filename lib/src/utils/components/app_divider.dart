import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

class AppDivider {
  static build({Color? color, double? width, double? height}) => Container(
        width: width ?? double.infinity,
        height: height ?? 1.2,
        decoration: BoxDecoration(
          color: color ?? AppColors.kgrayColor50,
        ),
      );
}
