import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';

import '../style/app_colors.dart';

class FixedBTMSheet {
  static Widget buildFixedSheet(
          {
          /// padding values
          double left = AppDim.k16,
          double right = AppDim.k16,
          double top = AppDim.k0,
          double bottom = AppDim.k0,
          EdgeInsetsGeometry? padding,

          /// margin values
          double leftmargin = AppDim.k0,
          double rightmargin = AppDim.k0,
          double topmargin = AppDim.k0,
          double bottommargin = AppDim.k0,
          EdgeInsetsGeometry? margin,

          /// other values
          double? height,
          double? width,
          BorderRadiusGeometry? borderRadius,
          Color? color,
          BoxBorder? border,

          /// add single child

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
        height: height,
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
