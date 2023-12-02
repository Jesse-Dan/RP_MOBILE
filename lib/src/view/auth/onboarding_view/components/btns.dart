import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';

import '../../../../utils/enums/enums.dart';

class OnboardingAppBtns extends StatefulWidget {
  const OnboardingAppBtns({super.key});

  @override
  State<OnboardingAppBtns> createState() => _OnboardingAppBtnsState();
}

class _OnboardingAppBtnsState extends State<OnboardingAppBtns> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 112,
      decoration: const BoxDecoration(
        color: Color(0xFFFEFEFE),
        boxShadow: [
          BoxShadow(
            color: Color(0x1E898A8D),
            blurRadius: 1,
            offset: Offset(0, -1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            btnText: 'Skip',
            buttonType: ButtonType.LONG_BTN,
            btnColor: AppColors.kprimaryColor100,
            btnTextColor: AppColors.kprimaryColor500,
          ),
          const SizedBox(width: AppDimentions.k20 + 4),
          AppButton(
            btnText: 'Continue',
            buttonType: ButtonType.LONG_BTN,
          )
        ],
      ),
    );
  }
}
