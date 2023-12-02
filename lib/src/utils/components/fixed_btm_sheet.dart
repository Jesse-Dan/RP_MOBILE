import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';

import '../style/app_colors.dart';

class FixedBTMSheet {
  static Widget buildFixedSheet(
          {
          /// padding values
          double left = AppDimentions.k16,
          double right = AppDimentions.k16,
          double top = AppDimentions.k0,
          double bottom = AppDimentions.k0,
          EdgeInsetsGeometry? padding,

          /// margin values
          double leftmargin = AppDimentions.k0,
          double rightmargin = AppDimentions.k0,
          double topmargin = AppDimentions.k0,
          double bottommargin = AppDimentions.k0,
          EdgeInsetsGeometry? margin,

          /// other values
          double? height,
          double? width,
          BorderRadiusGeometry? borderRadius,
          Color? color,
          BoxBorder? border,

          /// child
          Widget? child}) =>
      Container(
        padding: padding ??
            EdgeInsets.only(
              left: left,
              right: right,
              bottom: bottom,
              top: top,
            ),
        margin: margin ??
            EdgeInsets.only(
              left: leftmargin,
              right: rightmargin,
              bottom: bottommargin,
              top: topmargin,
            ),
        // height: height ?? 208.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: border ??
              Border.all(color: AppColors.kgrayColor100, width: 1.5.w),
          color: color,
          borderRadius: borderRadius ??
              const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
        ),
        child: child,
      );
}
