import 'package:flutter/material.dart';

import '../../../../../../utils/components/app_simple_app_bar.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppSimpleAppBar(context, title: 'Create Quiz'),
    );
  }
}
