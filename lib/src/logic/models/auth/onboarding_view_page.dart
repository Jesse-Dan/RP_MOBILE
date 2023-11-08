import 'package:flutter/material.dart';

class OnboardingViewModel {
  String title;
  String subtitle;
  Widget imgWiget;
  Gradient gradient;

  OnboardingViewModel({
    required this.title,
    required this.subtitle,
    required this.imgWiget,
    required this.gradient,
  });

  static var pages = <OnboardingViewModel>[
    OnboardingViewModel(
      title: 'Connect with Everyone Instantly!',
      subtitle:
          'Here, you are already friends with the world. Get ready to expand your reach and connect effortlessly. No influencers, just you. ',
      imgWiget: Image.asset('assets/images/ob_1.png'),
      gradient: const LinearGradient(
        begin: Alignment(0.19, -0.98),
        end: Alignment(-0.19, 0.98),
        colors: [
          Color(0xFF975B64),
          Color(0xFFB76E79),
          Color(0xFFFFB6C1),
          Color(0xBC00C4CC)
        ],
      ),
    ),
    OnboardingViewModel(
      title: 'A World of Friends Awaits',
      subtitle:
          ' Instantly connect with everyone on the platform and experience the true essence of a global community. Your network is boundless. Explore, share, and connect like never before.',
      imgWiget: Image.asset('assets/images/ob_2.png'),
      gradient: const LinearGradient(
        begin: Alignment(0.19, -0.98),
        end: Alignment(-0.19, 0.98),
        colors: [
          Color(0xFF975B64),
          Color(0xFFB76E79),
          Color(0xFFFFB6C1),
          Color(0xBC00C4CC)
        ],
      ),
    ),
    OnboardingViewModel(
      title: 'Your Voice, Your Reach',
      subtitle:
          'You have the reach you need to shine. Say what matters to you, and let the world listen. Start your journey today.',
      imgWiget: Image.asset('assets/images/ob_3.png'),
      gradient: const LinearGradient(
        begin: Alignment(0.19, -0.98),
        end: Alignment(-0.19, 0.98),
        colors: [
          Color(0xFF975B64),
          Color(0xFFB76E79),
          Color(0xFFFFB6C1),
          Color(0xBC00C4CC)
        ],
      ),
    )
  ];
}
