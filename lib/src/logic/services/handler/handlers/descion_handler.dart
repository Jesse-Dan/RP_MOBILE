import 'package:flutter/material.dart';

import '../../../../utils/components/app_dialogue.dart';
import '../../../../utils/enums/enums.dart';
import '../base_handler.dart';

class DecisionHandler {
  final String? title;

  final String message;
  final StackTrace? stackTrace;
  final VoidCallback? callBackOne;
  final VoidCallback? callBackTwo;
  final BuildContext context;
  final dynamic callBack;
  final String btnText;
  final bool barrierDismissible;
  final Tag tag;
  final String? callBackTextOne;
  final String? callBackTextTwo;
  final AppDialogue2Type appDialogue2Type;

  DecisionHandler({
    this.appDialogue2Type = AppDialogue2Type.one,
    this.callBackTextOne,
    this.callBackTextTwo,
    this.title,
    this.callBackOne,
    this.callBackTwo,
    required this.context,
    this.message = 'an unexpected error occured !',
    this.stackTrace,
    this.callBack,
    this.btnText = '',
    this.barrierDismissible = false,
    this.tag = Tag.LOADING,
  }) {
    BaseHandler(
        context: context,
        message: message,
        tag: tag,
        stackTrace: stackTrace,
        callBack: callBack,
        btnText: btnText,
        barrierDismissible: barrierDismissible,
        child: AppDialogue2(
          title: title,
          message: message,
          btnText: btnText,
          appDialogue2Type: appDialogue2Type,
          callBackOne: callBackOne,
          callBackTwo: callBackTwo,
          callBackTextOne: callBackTextOne,
          callBackTextTwo: callBackTextTwo,
        ));
  }
}
