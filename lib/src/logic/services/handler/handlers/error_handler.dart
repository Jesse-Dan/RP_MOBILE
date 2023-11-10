import 'package:flutter/material.dart';

import '../../../../utils/enums/enums.dart';
import '../base_handler.dart';

class ErrorHandler {
  final String message;
  final StackTrace? stackTrace;
  final BuildContext context;
  final dynamic callBack;
  final String btnText;
  final bool barrierDismissible;
  final Tag tag;
  ErrorHandler({
    required this.context,
    this.message = 'an unexpected error occured !',
    this.stackTrace,
    this.callBack,
    this.btnText = '',
    this.barrierDismissible = false,
    this.tag = Tag.ERROR,
  }) {
    BaseHandler(
      context: context,
      message: message,
      tag: tag,
      stackTrace: stackTrace,
      callBack: callBack,
      btnText: btnText,
      barrierDismissible: barrierDismissible,
    );
  }
}
