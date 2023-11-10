import 'dart:async';
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/view/auth/onboarding_view/onboarding_view.dart';

import '../../base/base_scaffold.dart';

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
      body: Align(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/rp_logo_with_text.png',
          width: 218,
          height: 38,
        ),
      ),
    );
  }
}
