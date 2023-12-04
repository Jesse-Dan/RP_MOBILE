import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';

import '../../../../utils/enums/enums.dart';

class OnboardingAppBtns extends StatefulWidget {
  final PageController pageController;
  final void Function()? onContinueTap;
  final void Function()? onSkipTap;
  const OnboardingAppBtns(
      {super.key,
      required this.pageController,
      this.onContinueTap,
      this.onSkipTap});

  @override
  State<OnboardingAppBtns> createState() => _OnboardingAppBtnsState();
}

class _OnboardingAppBtnsState extends State<OnboardingAppBtns> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 430,
      // height: 112,
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
            applyInternalPadding: false,
            btnText: 'Skip',
            buttonType: ButtonType.LONG_BTN,
            btnColor: AppColors.kprimaryColor100,
            btnTextColor: AppColors.kprimaryColor500,
            onTap: widget.onSkipTap,
          ),
          const SizedBox(width: AppDimentions.k20 + 4),
          AppButton(
            applyInternalPadding: false,
            btnText: 'Continue',
            buttonType: ButtonType.LONG_BTN,
            onTap: widget.onContinueTap,
          )
        ],
      ),
    );
  }
}
