// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/error_handler.dart';
import 'package:recenth_posts/src/view/auth/onboarding_view/onboarding_view.dart';

import '../../../logic/repository/auth/csfr_token_repo.dart';
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
        });    super.initState();
  }

  // Future<void> _initialize() async {
    // try {
    //   CSFRTokenRepo csfrTokenRepo = CSFRTokenRepo();
    //   if (await csfrTokenRepo.getToken()) {
    //     Timer(const Duration(seconds: 4), () {
    //       Go(context, routeName: OnboardingView.routeName).toAndClearAll();
    //     });
    //   } else {
    //     Go(context).pop();
    //   }
    // } catch (e) {
    //   ErrorHandler(context: context,message: e.toString());
    //   Go(context).pop();
    // }
  // }

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
