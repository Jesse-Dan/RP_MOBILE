
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';

import '../enums/enums.dart';
import '../style/app_colors.dart';
import '../style/app_dimentions.dart';
import 'app_button.dart';

Future shareBtmSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    enableDrag: true,
    context: context,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, putState) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: AppDim.k20 + 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.kbrandWhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 56,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 1.5,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: AppColors.kgrayColor200,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Share this Post',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0B0B0B),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 350,
                  height: 26,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/sms.svg',
                              width: 24,
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Send via Direct Message',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    ShareIcons(
                      txt: 'Copy Link',
                      img: 'link.svg',
                    ),
                    SizedBox(width: 20),
                    ShareIcons(
                      txt: 'Share via...',
                      img: 'mdi-light_share.svg',
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const SingleChildScrollView(
                  child: SizedBox(
                    // width: 622,
                    height: 90,
                    child: Row(
                      children: [
                        ShareSocialIcons(
                          txt: 'WhatsApp',
                          img: 'logos_whatsapp-icon.svg',
                        ),
                        SizedBox(width: 20),
                        ShareSocialIcons(
                          txt: 'Instagram',
                          img: 'skill-icons_instagram.svg',
                        ),
                        SizedBox(width: 20),
                        ShareSocialIcons(
                          txt: 'Facebook',
                          img: 'logos_facebook.svg',
                        ),
                        SizedBox(width: 20),
                        ShareSocialIcons(
                          txt: 'X',
                          img: 'devicon_twitter.svg',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                AppButton(
                  borderColor: AppColors.kgrayColor300,
                  addBorder: true,
                  btnColor: Colors.transparent,
                  buttonType: ButtonType.LONG_BTN,
                  btnText: 'Cancel',
                  btnTextColor: AppColors.kgrayColor900,
                  flex: true,
                  onTap: () {
                    Go(context).pop();
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      );
    },
  );
}

class ShareIcons extends StatelessWidget {
  final String txt;
  final String img;
  const ShareIcons({
    super.key,
    required this.txt,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 56,
          height: 56,
          decoration: const ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(width: 0.50, color: Color(0xFFB0B0B0)),
            ),
          ),
          child: SvgPicture.asset(
            'assets/icons/$img',
            color: AppColors.kgrayColor900,
            height: 24,
            width: 24,
          ),
        ),
        const SizedBox(height: 9.17),
        Text(txt,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.kgrayColor900))
      ],
    );
  }
}

class ShareSocialIcons extends StatelessWidget {
  final String txt;
  final String img;
  const ShareSocialIcons({
    super.key,
    required this.txt,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/$img',
          height: 56,
          width: 56,
        ),
        const SizedBox(height: 9.17),
        Text(txt,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.kgrayColor900))
      ],
    );
  }
}
