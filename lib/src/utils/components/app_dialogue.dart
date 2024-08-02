// ignore_for_file: unused_element

import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../enums/enums.dart';

// enum Tag {
//   DEBUG,
//   ERROR,
//   SUCCESS,
//   LOADING,
//   CALLBACK,
//   DIO_REQUEST,
//   SERVICE_ACTION,
//   PERSON_SUCCESS,
//   LOADING
// }

class AppDialogue extends StatelessWidget {
  const AppDialogue(
      {Key? key,
      this.tag = Tag.LOADING,
      this.message,
      this.btnText = '',
      this.title,
      this.callBackOne,
      this.callBackTwo,
      this.callBackTextOne,
      this.callBackTextTwo,
      this.handlerBtnCount})
      : super(key: key);
  final Tag tag;
  final String? message;
  final String? title;
  final VoidCallback? callBackOne;
  final String btnText;
  final VoidCallback? callBackTwo;
  final String? callBackTextOne;
  final String? callBackTextTwo;
  final HandlerBtnCount? handlerBtnCount;

  String getImage(Tag tag) {
    switch (tag) {
      case Tag.PERSON_SUCCESS:
        return 'assets/images/person_alert.png';
      case Tag.SUCCESS:
        return 'assets/images/done_alert.png';
      default:
        return 'assets/images/done_alert.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget>? actions = _getActions(context);

    return AlertDialog.adaptive(
      surfaceTintColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      insetPadding: const EdgeInsets.only(left: 50, right: 50),
      buttonPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      actionsPadding: const EdgeInsets.all(0),
      actionsOverflowButtonSpacing: 0,
      actionsOverflowAlignment: OverflowBarAlignment.end,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      titlePadding: const EdgeInsets.symmetric(vertical: 16),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title ?? '',
          style: TextStyle(
            color: AppColors.kprimaryColor600,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      content: Text(
        message ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF464646),
          fontSize: 16,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: actions ?? [],
    );
  }

  List<Widget>? _getActions(BuildContext context) {
    if (handlerBtnCount == HandlerBtnCount.one) {
      return [
        _alertBTN(context, callBackTextOne ?? 'Button Text', callBackOne),
      ];
    }
    if (handlerBtnCount == HandlerBtnCount.two) {
      return [
        _alertBTN(context, callBackTextOne ?? 'Button 1 Text', callBackOne),
        _alertBTN(context, callBackTextTwo ?? 'Button 2 Text', callBackTwo),
      ];
    }
    return [];
  }

  Padding _alertBTN(
      BuildContext context, String btnText, VoidCallback? callback) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Material(
        child: GestureDetector(
          onTap: callback ?? () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: AppColors.kprimaryColor600.withOpacity(0.2)),
            height: 45,
            width: 115,
            child: Center(
              child: Text(
                btnText,
                style: GoogleFonts.dmSans(
                  color: AppColors.kprimaryColor600.withOpacity(0.9),
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
