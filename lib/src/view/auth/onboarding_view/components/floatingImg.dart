// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../logic/models/app/onboarding_screen/onboarding_screen.dart';

class FloatingImage extends StatefulWidget {
  final int currentIndex;
  final void Function(int)? onPageChanged;
  final PageController pageController;

  const FloatingImage(
      {super.key,
      required this.currentIndex,
      this.onPageChanged,
      required this.pageController});

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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Positioned(
        top: 50,
        left: MediaQuery.of(context).size.width / 6,
        child: OnboardingViewModel.pages[widget.currentIndex].imgWiget
            .animate()
            .slide(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInBack),
      ),
    );
  }
}
