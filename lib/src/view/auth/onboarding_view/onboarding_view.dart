// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/view/auth/onboarding_view/login_mode.dart';

import '../../../logic/models/app/onboarding_screen/onboarding_screen.dart';
import '../../../utils/style/app_colors.dart';
import '../../../utils/style/app_dimentions.dart';
import '../../base/base_scaffold.dart';
import 'components/floatingImg.dart';
import 'components/txt.dart';

class OnboardingView extends StatefulWidget {
  static String routeName = '/onboarding.view';

  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final TextEditingController _ctl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        addBackgroundColor: false,
        backgroundColor: AppColors.kbrandWhite,
        physics: const NeverScrollableScrollPhysics(),
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: PageView.builder(
            controller: pageController,
            itemCount: OnboardingViewModel.pages.length,
            physics: const BouncingScrollPhysics(),
            pageSnapping: true,
            onPageChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            itemBuilder: (context, i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppDimentions.k20 - 20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: FloatingImage(
                                pageController: pageController,
                                currentIndex: currentIndex,
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: currentIndex == i ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 500),
                              child: ButtomSection(
                                currentIndex: currentIndex,
                                pageController: pageController,
                                onContinueTap: () {
                                  if (currentIndex != 2) {
                                    pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  } else {
                                    Go(context,
                                            routeName: LoginModeView.routeName)
                                        .toAndClearAll();
                                  }
                                },
                                onSkipTap: () {
                                  Go(context,
                                          routeName: LoginModeView.routeName)
                                      .toAndClearAll();
                                },
                                onDotClicked: (index) {
                                  pageController.jumpToPage(index);
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
