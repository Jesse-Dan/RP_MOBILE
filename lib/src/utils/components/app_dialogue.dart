import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../enums/enums.dart';

class AppDialogue extends StatelessWidget {
  const AppDialogue(
      {Key? key,
      required this.tag,
      this.message,
      this.callBack,
      this.btnText = ''})
      : super(key: key);
  final Tag tag;
  final String? message;
  final VoidCallback? callBack;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      insetPadding: const EdgeInsets.only(left: 10, right: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(0),
      title: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Colors.blue),
            width: double.infinity,
            height: 50,
          ),
          Positioned(
            top: 30,
            left: 342 / 4,
            right: 342 / 4,
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                tag == Tag.ERROR
                    ? 'assets/images/error.svg'
                    : 'assets/images/success.svg',
                height: 42,
                width: 50,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 342 / 8, right: 342 / 8, top: 30, bottom: 10),
            child: Center(
              child: Text(
                message ?? 'Hello! \n Contact support@Vigilant.ng',
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
      actions: [
        _alertBTN(context),
      ],
    );
  }

  Padding _alertBTN(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: callBack ?? () => Navigator.pop(context),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: Colors.blue),
          height: 42,
          width: 115,
          child: Center(
            child: Text(
              btnText == ''
                  ? tag == Tag.ERROR
                      ? 'Okay'
                      : 'Thank you'
                  : btnText,
              style: GoogleFonts.dmSans(
                color: Colors.blue,
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
