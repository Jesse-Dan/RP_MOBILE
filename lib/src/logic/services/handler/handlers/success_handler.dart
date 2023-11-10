import 'package:flutter/material.dart';

import '../../../../utils/enums/enums.dart';
import '../base_handler.dart';

class SuccessHandler {
  final String message;
  final StackTrace? stackTrace;
  final BuildContext context;
  final dynamic callBack;
  final String btnText;
  final bool barrierDismissible;
  SuccessHandler({
    required this.context,
    this.message = 'Done',
    this.stackTrace,
    this.callBack,
    this.btnText = '',
    this.barrierDismissible = false,
  }) {
    BaseHandler(
      context: context,
      message: message,
      tag: Tag.SUCCESS,
      stackTrace: stackTrace,
      callBack: callBack,
      btnText: btnText,
      barrierDismissible: barrierDismissible,
    );
  }
}
