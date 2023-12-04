import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recenth_posts/src/utils/components/app_custom_loader.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Image.asset(getImage(tag))),
            const SizedBox(height: 32),
            Text(
              title ?? '',
              style: TextStyle(
                color: Color(0xFFF48B99),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              message ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF464646),
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            AppLoadingIndicator(
                loaderColor: AppColors.useHex('#F9A7B2'), size: 30.0),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );

    //  AlertDialog(
    // actionsAlignment: MainAxisAlignment.center,
    // insetPadding: const EdgeInsets.only(left: 10, right: 10),
    // shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(16.0))),
    // titlePadding: const EdgeInsets.all(0),
    // contentPadding: const EdgeInsets.all(0),
    //   title: Stack(
    //     clipBehavior: Clip.none,
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //             borderRadius: const BorderRadius.only(
    //                 topLeft: Radius.circular(16),
    //                 topRight: Radius.circular(16)),
    //             color: AppColors.kwineColor.withOpacity(0.2)),
    //         width: double.infinity,
    //         height: 50,
    //       ),
    //       const Positioned(
    //         top: 30,
    //         left: 342 / 4,
    //         right: 342 / 4,
    //         child: Align(
    //           alignment: Alignment.topCenter,
    //           // child: SvgPicture.asset(
    //           //   tag == Tag.ERROR
    //           //       ? 'assets/images/error.svg'
    //           //       : 'assets/images/success.svg',
    //           //   height: 42,
    //           //   width: 50,
    //           // ),
    //         ),
    //       ),
    //     ],
    //   ),
    //   content: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(
    //             left: 342 / 8, right: 342 / 8, top: 30, bottom: 10),
    //         child: Center(
    //           child: Text(
    //             message ?? 'Hello! \n Contact support@bakkaz.com',
    //             textAlign: TextAlign.center,
    //             style: GoogleFonts.dmSans(
    //               fontWeight: FontWeight.w400,
    //               fontSize: 16,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    //   actions: [
    //     _alertBTN(context),
    //   ],
    // );
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
