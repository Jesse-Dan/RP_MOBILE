// ignore_for_file: use_build_context_synchronously

import 'dart:async';

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
    Timer(const Duration(seconds: 4), () {
      Go(context, routeName: OnboardingView.routeName).toAndClearAll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.kprimaryColor100,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppDimentions.space(height: 282),
            Image.asset(
              'assets/images/MainLogo.png',
              width: 303.80,
              height: 120.22,
            ),
            const SizedBox(height: AppDimentions.k20),
            SizedBox(
              width: 232,
              child: Text(
                'Share your life\'s moments and connect with others.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.useHex('#232323'),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
