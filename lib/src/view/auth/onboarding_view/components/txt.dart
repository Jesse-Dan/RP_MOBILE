// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../logic/models/app/onboarding_screen/onboarding_screen.dart';
import '../../../../utils/components/app_divider.dart';
import '../../../../utils/components/fixed_btm_sheet.dart';
import '../../../../utils/style/app_colors.dart';
import '../../../../utils/style/app_dimentions.dart';
import 'btns.dart';

class ButtomSection extends StatefulWidget {
  final int currentIndex;
  final PageController pageController;
final void Function()? onContinueTap;
  final void Function()? onSkipTap;  final void Function(int)? onDotClicked;
  const ButtomSection(
      {super.key,
      required this.pageController,
      required this.currentIndex,
      this.onDotClicked, this.onContinueTap, this.onSkipTap});

  @override
  State<ButtomSection> createState() => _ButtomSectionState();
}

class _ButtomSectionState extends State<ButtomSection> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = widget.currentIndex;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FixedBTMSheet.buildFixedSheet(
        color: AppColors.kbrandWhite,
        width: double.infinity,
        padding: EdgeInsets.all(
            AppDim.buildDimention(20, operation: "+", dimention: 4)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(OnboardingViewModel.pages[widget.currentIndex].title,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppDim.k16),
              Text(
                OnboardingViewModel.pages[widget.currentIndex].subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.kbrandsubtitleGrey),
              ),
              const SizedBox(height: AppDim.k20 + 10),
              Align(
                alignment: Alignment.centerLeft,
                child: SmoothPageIndicator(
                  controller: widget.pageController,
                  count: OnboardingViewModel.pages.length,
                  effect: ExpandingDotsEffect(
                      spacing: 4,
                      dotHeight: 8,
                      dotWidth: 8,
                      strokeWidth: 12,
                      activeDotColor: AppColors.kprimaryColor500,
                      dotColor: AppColors.kgrayColor100),
                  onDotClicked: widget.onDotClicked,
                ),
              ),
              const SizedBox(height: AppDim.k20),
              AppDivider.build(),
              const SizedBox(height: AppDim.k12),
              OnboardingAppBtns(
                onSkipTap: widget.onSkipTap,
                onContinueTap: widget.onContinueTap,
                pageController: widget.pageController,
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .scale(delay: 200.ms)
        .fade(duration: 500.ms, curve: Curves.easeInExpo);
  }
}
