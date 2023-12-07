import 'package:flutter/material.dart';

import '../../../../utils/enums/enums.dart';
import '../base_handler.dart';

class AppHandler {
  final String message;
  final String title;
  final StackTrace? stackTrace;
  final BuildContext context;
  final dynamic callBack;
  final String btnText;
  final bool barrierDismissible;
  final Tag tag;
  AppHandler({
    required this.context,
    required this.title,
    this.message = 'Please wait...\nYou will be directed to the homepage.',
    this.stackTrace,
    this.callBack,
    this.btnText = '',
    this.barrierDismissible = false,
    required this.tag,
  }) {
    BaseHandler(
      context: context,
      message: message,
      tag: tag,
      stackTrace: stackTrace,
      callBack: callBack,
      btnText: btnText,
      barrierDismissible: barrierDismissible, title: title,
    );
  }
}
