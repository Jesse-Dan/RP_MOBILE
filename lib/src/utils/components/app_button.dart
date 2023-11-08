// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../enums/enums.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
      required this.btnText,
      this.btntTextAlign,
      this.onDoubleTap,
      this.onTap,
      this.btnColor,
      this.borderColor,
      this.buttonType,
      this.btnTxtFontStyle,
      this.btnTxtFontSize,
      this.addBorder,
      this.onLongPress,
      this.btnTextColor,
      this.applyInternalPadding,
      this.width = 100,
      this.height = 48})
      : super(key: key);
  final String btnText;
  final TextAlign? btntTextAlign;
  final void Function()? onDoubleTap;
  final void Function()? onTap;
  void Function()? onLongPress;
  final Color? btnColor;
  final Color? borderColor;
  final Color? btnTextColor;
  final ButtonType? buttonType;
  final TextStyle? btnTxtFontStyle;
  final double? btnTxtFontSize;
  final bool? addBorder;
  final bool? applyInternalPadding;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        margin: (applyInternalPadding ?? false)
            ? const EdgeInsets.all(5)
            : const EdgeInsets.all(0),
        height: 48,
        width: (buttonType ?? ButtonType.SHORT_BTN) == ButtonType.LONG_BTN
            ? double.infinity
            : width,
        decoration: BoxDecoration(
          border: addBorder ?? false
              ? Border.all(color: borderColor ?? Colors.white)
              : null,
          borderRadius: BorderRadius.circular(9.sp),
          color: btnColor ?? AppColors.kwineColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            btnText,
            style: btnTxtFontStyle ??
                TextStyle(
                  fontFamily: 'Satoshi',
                  color: btnTextColor ?? AppColors.kWhiteColor,
                  fontSize: btnTxtFontSize ?? 14.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.36.sp,
                ),
            textAlign: btntTextAlign ?? TextAlign.start,
          ),
        ),
      ),
    );
  }
}
