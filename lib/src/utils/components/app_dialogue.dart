// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recenth_posts/src/utils/components/app_custom_loader.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';

import '../enums/enums.dart';

class AppDialogue extends StatelessWidget {
  const AppDialogue(
      {Key? key,
      this.tag = Tag.LOADING,
      this.message,
      this.callBack,
      this.btnText = '',
      this.title})
      : super(key: key);
  final Tag tag;
  final String? message;
  final String? title;
  final VoidCallback? callBack;
  final String btnText;

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
    return AlertDialog(
      insetPadding: const EdgeInsets.only(left: 10, right: 10),
      backgroundColor: Colors.transparent,
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        height: 464,
        width: 350,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: GestureDetector(
          onTap: callBack,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimentions.k20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Image.asset(getImage(tag))),
                const SizedBox(height: 32),
                Text(
                  title ?? '',
                  style: const TextStyle(
                    color: Color(0xFFF48B99),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  message ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF464646),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                AppLoadingIndicator(
                    loaderColor: AppColors('#F9A7B2'), size: 30.0),
                const SizedBox(height: 40)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _alertBTN(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: callBack ?? () => Navigator.pop(context),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.kwineColor.withOpacity(0.2)),
          height: 42,
          width: 115,
          child: Center(
            child: Text(
              btnText == ''
                  ? tag == Tag.ERROR
                      ? 'Okay'
                      : 'Proceed'
                  : btnText,
              style: GoogleFonts.dmSans(
                color: AppColors.kwineColor.withOpacity(0.9),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppDialogue2 extends StatelessWidget {
  final String? message;
  final String? title;
  final VoidCallback? callBackOne;
  final VoidCallback? callBackTwo;
  final String? callBackTextOne;
  final String? callBackTextTwo;

  final String btnText;
  final AppDialogue2Type appDialogue2Type;

  const AppDialogue2(
      {super.key,
      this.message,
      this.title,
      required this.btnText,
      this.callBackOne,
      this.callBackTwo,
      this.appDialogue2Type = AppDialogue2Type.two,
      this.callBackTextOne,
      this.callBackTextTwo});

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = _getActions(context);

    return appDialogue2Type == AppDialogue2Type.loading
        ? AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            insetPadding: const EdgeInsets.only(left: 10, right: 10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            titlePadding: const EdgeInsets.all(0),
            contentPadding: const EdgeInsets.all(0),
            title: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                  vertical: AppDimentions.k20, horizontal: AppDimentions.k20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              width: double.infinity,
              height: 50,
              child: Text(
                title ?? 'Processing Action',
                style: const TextStyle(
                  color: Color(0xFFD75B6B),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppDimentions.k16),
                Text(
                  message ?? 'action..',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF464646),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: AppDimentions.k20 * 2),
                AppLoadingIndicator(),
                const SizedBox(height: AppDimentions.k20),
              ],
            ),
          )
        : AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            insetPadding: const EdgeInsets.only(left: 30, right: 30),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            titlePadding: const EdgeInsets.all(0),
            contentPadding: const EdgeInsets.all(0),
            title: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: AppDimentions.k20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              width: double.infinity,
              height: 50,
              child: Text(
                title ?? 'Processing Action',
                style: const TextStyle(
                  color: Color(0xFFD75B6B),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 342 / 8, right: 342 / 8, top: 30, bottom: 50),
                  child: Center(
                    child: Text(
                      message ?? 'Hello! \n Contact support@bakkaz.com',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actionsOverflowButtonSpacing: AppDimentions.k14,
            actions: actions,
          );
  }

  List<Widget> _getActions(BuildContext context) {
    if (appDialogue2Type == AppDialogue2Type.one) {
      return [
        _alertBTN(context, callBackTextOne ?? 'Button Text', callBackOne),
      ];
    } else {
      return [
        _alertBTN(context, callBackTextOne ?? 'Button 1 Text', callBackOne),
        _alertBTN(context, callBackTextTwo ?? 'Button 2 Text', callBackTwo),
      ];
    }
  }

  Padding _alertBTN(
      BuildContext context, String btnText, VoidCallback? callback) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: callback ?? () => Navigator.pop(context),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.kwineColor.withOpacity(0.2)),
          height: 42,
          width: 115,
          child: Center(
            child: Text(
              btnText,
              style: GoogleFonts.dmSans(
                color: AppColors.kwineColor.withOpacity(0.9),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
