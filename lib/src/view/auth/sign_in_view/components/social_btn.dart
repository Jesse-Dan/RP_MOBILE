import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/style/app_colors.dart';

class SocialButton extends StatelessWidget {
  final Widget imageWidget;
  final String buttonText;
  final Color? textColor;

  const SocialButton({
    Key? key,
    required this.imageWidget,
    required this.buttonText,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 163.w,
      decoration: BoxDecoration(
          color: AppColors.kwineColor.withOpacity(0.07),
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          imageWidget,
          SizedBox(width: 8.w), // Adjust the spacing between image and text
          Text(
            buttonText,
            style: TextStyle(
              color: (textColor ?? AppColors.klightBlackColor).withOpacity(0.7),
              fontSize: 16.sp, // You can use ScreenUtil for responsive sizing
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
