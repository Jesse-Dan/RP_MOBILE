// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        addBackgroundColor: false,
        backgroundColor: AppColors.kbrandWhite,
        physics: const NeverScrollableScrollPhysics(),
        body: PageView.builder(
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
                    child: Stack(
                      children: [
                        FloatingImage(
                          pageController: pageController,
                          currentIndex: currentIndex,
                        ),
                        AnimatedOpacity(
                          opacity: currentIndex == i ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: ButtomSection(
                            currentIndex: currentIndex,
                            pageController: pageController,
                            onTap: () {
                              currentIndex++;
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
            );
          },
        ));
  }
}
