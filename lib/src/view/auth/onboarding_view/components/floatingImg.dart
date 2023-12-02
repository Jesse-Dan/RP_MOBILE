import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../logic/models/app/onboarding_screen/onboarding_screen.dart';

class FloatingImage extends StatefulWidget {
  final int currentIndex;
  final PageController pageController;
  final void Function(int)? onPageChanged;
  const FloatingImage(
      {super.key,
      required this.pageController,
      required this.currentIndex,
      this.onPageChanged});

  @override
  State<FloatingImage> createState() => _FloatingImageState();
}

class _FloatingImageState extends State<FloatingImage> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = widget.currentIndex;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: OnboardingViewModel.pages.length,
      onPageChanged: widget.onPageChanged,
      itemBuilder: (context, i) {
        return Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width / 6,
            child: Image.asset('assets/images/home_post_img.png')
                .animate()
                .slideY(duration: const Duration(milliseconds: 100)));
      },
    );
  }
}
