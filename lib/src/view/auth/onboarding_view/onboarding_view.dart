// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';

import '../../../utils/components/fixed_btm_sheet.dart';
import '../../../utils/style/app_colors.dart';
import '../../../utils/style/app_dimentions.dart';
import '../../base/base_scaffold.dart';
import 'components/btns.dart';

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
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: false,
      backgroundColor: AppColors.kbrandWhite,
      addBackgroundColor: true,
      physics: const NeverScrollableScrollPhysics(),
      body: SingleChildScrollView(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: AppDimentions.k20 + 30),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset('assets/images/home_post_img.png')),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FixedBTMSheet.buildFixedSheet(
                      height: 408,
                      color: AppColors.kbrandWhite,
                      width: double.infinity,
                      padding: EdgeInsets.all(AppDimentions.buildDimention(20,
                          operation: "+", dimention: 4)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text('Stay updated, anytime, anywhere.',
                                style: Theme.of(context).textTheme.headline1),
                            const SizedBox(height: AppDimentions.k16),
                            Text(
                              'Welcome to our news app – your ultimate destination for trending news, exclusive stories, and personalized content.',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: AppColors.kbrandsubtitleGrey),
                            ),
                            const SizedBox(height: AppDimentions.k20 + 10),
                            const OnboardingAppBtns(),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
