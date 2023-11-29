import 'package:flutter/material.dart';

class OnboardingViewModel {
  String title;
  String subtitle;
  Widget imgWiget;

  OnboardingViewModel({
    required this.title,
    required this.subtitle,
    required this.imgWiget,
  });

  static var pages = <OnboardingViewModel>[
    OnboardingViewModel(
      title: 'Connect with Everyone Instantly!Stay updated, anytime, anywhere.',
      subtitle:
          'Welcome to our news app – your ultimate destination for trending news, exclusive stories, and personalized content.',
      imgWiget: Image.asset('assets/images/ob_1.png'),
    ),
    OnboardingViewModel(
      title: 'Share your voice with the world.',
      subtitle:
          ' Empower your voice. Share your unique perspective and creativity with the world. Your story is waiting to be heard.',
      imgWiget: Image.asset('assets/images/ob_2.png'),
    ),
    OnboardingViewModel(
      title: 'Find your community and thrive together.',
      subtitle:
          'Become part of our lively community of news enthusiasts. Share your interests and participate in meaningful discussions.',
      imgWiget: Image.asset('assets/images/ob_3.png'),
    )
  ];
}
