/// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../utils/components/app_dialogue.dart';
import '../../../utils/components/app_custom_loader.dart';
import '../../../utils/enums/enums.dart';
import '../logger/logger.dart';

/// HandleAlertTypedisplay
class BaseHandler {
  /// Type ofAlertTypeto show
  final Tag tag;

  /// The message to display in the alert
  final String message;

  /// Stack trace if applicable
  final StackTrace? stackTrace;

  /// The context to show theAlertTypein
  final BuildContext context;

  /// Callback function whenAlertTypeis dismissed
  final dynamic callBack;

  /// Text for the action button in the alert
  final String btnText;

  /// Whether theAlertTypecan be dismissed by tapping outside

  final bool barrierDismissible;
  BaseHandler({
    required this.context,
    required this.tag,
    required this.message,
    this.stackTrace,
    this.callBack,
    this.btnText = '',
    this.barrierDismissible = false,
  }) {
    /// Show theAlertTypedialog when an instance of HandelerModel is created
    showDialog(
        barrierDismissible: barrierDismissible,

        /// DismissAlertTypeby tapping outside
        context: context,
        builder: (_) => tag == Tag.LOADING
            ? AppLoadingIndicator()
            : AppDialogue(
                tag: tag,
                message: message,
                callBack: callBack,
                btnText: btnText,
              ));

    Logger.log(tag: tag, message: message, error: null, stackTrace: stackTrace);
  }
}
