// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';

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
  double previousPageOpacity = 1.0;
  final TextEditingController _ctl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.kwhiteColor,
      physics: const NeverScrollableScrollPhysics(),
      body: AnimatedContainer(
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
                    currentIndex: currentIndex,
                    pageController: pageController,
                    onPageChanged: (val) {
                      setState(() {
                        currentIndex = val;
                      });
                    },
                  ),
                  MyWidget(
                      currentIndex: currentIndex,
                      pageController: pageController,
                      onTap: () {
                        currentIndex++;
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
