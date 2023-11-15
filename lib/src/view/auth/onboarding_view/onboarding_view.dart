// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/sign_in_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../logic/models/auth/onboarding_view_page.dart';
import '../../../utils/style/app_colors.dart';
import '../../base/base_scaffold.dart';

class OnboardingView extends StatefulWidget {
  static String routeName = '/onboarding.view';

  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  double previousPageOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.kblackColor,
      addBackgroundColor: false,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(
          top: 35,
          bottom: 10,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.10, -0.98),
            end: Alignment(-0.19, 0.98),
            colors: [
              Color(0xFF975B64),
              Color(0xFFB76E79),
              Color(0xFFFFB6C1),
              Color(0xBC00C4CC)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: currentIndex == 0 ? 43.h : 23.5.h,
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: OnboardingViewModel.pages.length,
                onPageChanged: (newVal) {
                  setState(() {
                    currentIndex = newVal;
                  });
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, i) => AnimatedOpacity(
                  opacity: currentIndex == i ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    width: 314.w,
                    height: 314.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 314.w,
                          height: 250.h,
                          // clipBehavior: Clip.antiAlias,
                          child:
                              OnboardingViewModel.pages[currentIndex].imgWiget,
                        ),
                        SizedBox(height: currentIndex == 0 ? 31.h : 45.h),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          height: 250.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: const Alignment(0.67, -0.74),
                              end: const Alignment(-0.67, 0.74),
                              colors: [
                                Colors.white.withOpacity(0.699999988079071),
                                Colors.white.withOpacity(0.10000000149011612)
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 14.h),
                              SmoothPageIndicator(
                                controller: pageController,
                                count: OnboardingViewModel.pages.length,
                                effect: ExpandingDotsEffect(
                                    spacing: 4,
                                    dotHeight: 8,
                                    dotWidth: 8,
                                    strokeWidth: 12,
                                    activeDotColor: AppColors.kWhiteColor,
                                    dotColor: AppColors.kdotGrey),
                                onDotClicked: (index) {
                                  pageController.jumpToPage(index);
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                              SizedBox(height: 14.h),
                              Text(
                                OnboardingViewModel.pages[currentIndex].title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF975B64),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.41,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 302.w,
                                  height: 112.spMin,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    OnboardingViewModel
                                        .pages[currentIndex].subtitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.41,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, bottom: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppButton(
                                      btnText: 'Skip',
                                      buttonType: ButtonType.SHORT_BTN,
                                      applyInternalPadding: true,
                                      btnColor: Colors.transparent,
                                      borderColor: AppColors.kWhiteColor
                                          .withOpacity(0.5),
                                      width: 80.w,
                                    ),
                                    AppButton(
                                      btnText: 'Next',
                                      buttonType: ButtonType.SHORT_BTN,
                                      applyInternalPadding: true,
                                      width: 80.w,
                                      onTap: () {
                                        if (currentIndex == 2) {
                                          Go(context,
                                                  routeName:
                                                      LoginView.routeName)
                                              .to();
                                        } else {
                                          pageController.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.easeIn);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
