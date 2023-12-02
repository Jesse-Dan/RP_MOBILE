import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';

import '../../../../utils/enums/enums.dart';
import '../../../../utils/style/app_colors.dart';

class OnboardingAppBtns extends StatefulWidget {
  final PageController pageController;
  final void Function()? onTap;
  const OnboardingAppBtns({super.key, required this.pageController, this.onTap});

  @override
  State<OnboardingAppBtns> createState() => _OnboardingAppBtnsState();
}

class _OnboardingAppBtnsState extends State<OnboardingAppBtns> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 112,
      padding: const EdgeInsets.only(top: AppDimentions.k20 + 6),
      decoration: BoxDecoration(
        color: AppColors.kwhiteColor,
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
            onTap:widget.onTap,
          )
        ],
      ),
    );
  }
}
