// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:recenth_posts/src/utils/style/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';

import '../../base/base_scaffold.dart';
import '../onboarding_view/onboarding_view.dart';

class SplashScreenView extends StatefulWidget {
  static String routeName = '/splash.screen.view';

  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      Go(context, routeName: OnboardingView.routeName).toAndClearAll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.kprimaryColor100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppDim.space(height: MediaQuery.of(context).size.height / 2.5),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 232, child: Image.asset(AppAsset.mainGreenLogoNoBG)),
          ),
          const SizedBox(height: AppDim.k20),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 232,
              child: Text(
                'Share your life\'s moments and connect with others.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.kprimaryColor800,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
