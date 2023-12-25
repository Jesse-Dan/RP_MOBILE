// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';

import '../style/app_colors.dart';
import 'notifier_dot.dart';

class ActionBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String imgUrl;
  final Widget? child;
  final bool addbadge;
  final Color? color;
  final double? height;
  final double? width;

  const ActionBtn({
    super.key,
    this.onPressed,
    required this.imgUrl,
    this.child,
    this.addbadge = false,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return addbadge
        ? Stack(
            children: [
              InkWell(
                onTap: onPressed,
                child: child ??
                    SvgPicture.asset(
                      color: color,
                      'assets/icons/$imgUrl',
                      height: height ?? 24,
                      width: width ?? 24,
                    ),
              ),
              const NotifierDot()
            ],
          )
        : InkWell(
            onTap: onPressed,
            child: child ??
                SvgPicture.asset(
                  'assets/icons/$imgUrl',
                  height: 24,
                  width: 24,
                ),
          );
  }
}

class SearchTileMoreOptionsDD extends StatelessWidget {
  final String imgUrl;

  const SearchTileMoreOptionsDD({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.kbrandWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: SvgPicture.asset(
        'assets/icons/$imgUrl',
        height: 24,
        width: 24,
      ),
      onSelected: (value) {
        // Handle menu item selection
        if (kDebugMode) {
          print('Selected: $value');
        }
      },
      itemBuilder: (BuildContext context) {
        return SearchTilePopMenuItemModel.data
            .map(
              (item) => PopupMenuItem<String>(
                value: item.text,
                child: SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          'assets/icons/${item.img}',
                          height: 24,
                          width: 24,
                          color: AppColors.kblackColor,
                        ),
                      ),
                      Text(
                        item.text,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.kblackColor,
                            ),
                      ),
                    ],
                  ),
                ), // Use the text from the model
              ),
            )
            .toList();
      },
    );
  }
}

class PostMoreOptionsDD extends StatelessWidget {
  final String imgUrl;

  const PostMoreOptionsDD({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.kbrandWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: SvgPicture.asset(
        'assets/icons/$imgUrl',
        height: 24,
        width: 24,
      ),
      onSelected: (value) {
        // Handle menu item selection
        if (kDebugMode) {
          print('Selected: $value');
        }
      },
      itemBuilder: (BuildContext context) {
        return PostDetailsTopSectioonPopMenuItemModel.data
            .map((item) => PopupMenuItem<String>(
                  value: item.text,
                  child: SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            'assets/icons/${item.img}',
                            height: 24,
                            width: 24,
                            color: AppColors.kblackColor,
                          ),
                        ),
                        Text(
                          item.text,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.kblackColor,
                                  ),
                        ),
                      ],
                    ),
                  ), // Use the text from the model
                ))
            .toList();
      },
    );
  }
}

class PostDetailsTopSectioonPopMenuItemModel {
  final String img;
  final String text;
  final int? value;

  PostDetailsTopSectioonPopMenuItemModel(
      {this.value, required this.img, required this.text});
  static List<PostDetailsTopSectioonPopMenuItemModel> data = [
    PostDetailsTopSectioonPopMenuItemModel(
        img: 'solar_star-line-duotone.svg', text: 'Add to favourite'),
    PostDetailsTopSectioonPopMenuItemModel(
        img: 'volume-slash.svg', text: 'Mute @PR9343839'),
    PostDetailsTopSectioonPopMenuItemModel(
        img: 'gg_close-r.svg', text: 'Block @PR9343839'),
    PostDetailsTopSectioonPopMenuItemModel(img: 'ph_flag.svg', text: 'Report')
  ];
}

class SearchTilePopMenuItemModel {
  final String img;
  final String text;
  final int? value;

  SearchTilePopMenuItemModel(
      {this.value, required this.img, required this.text});
  static List<SearchTilePopMenuItemModel> data = [
    SearchTilePopMenuItemModel(
        img: 'solar_star-line-duotone.svg', text: 'Add to favourite'),
    SearchTilePopMenuItemModel(
        img: 'lucide_thumbs-down.svg', text: 'Not interested in this'),
  ];
}

Future shareBtmSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    enableDrag: true,
    context: context,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, putState) {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimentions.k20 + 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.kbrandWhite,
              border: Border(top: BorderSide(color: AppColors.kgrayColor100)),
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
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.kgrayColor900))
      ],
    );
  }
}
