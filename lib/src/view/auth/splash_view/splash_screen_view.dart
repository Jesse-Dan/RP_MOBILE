import 'package:flutter/material.dart';

import '../../base/base_scaffold.dart';

class SplashScreenView extends StatefulWidget {
  static String routeName = '/splash.screen.view';

  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Align(
        alignment: Alignment.center,
        child: Image.asset(
          'rp_logo_with_text.png',
          width: 218,
          height: 38,
        ),
      ),
    );
  }
}
