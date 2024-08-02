// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/view/app/posts/components/create_post/create_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';

import '../style/app_colors.dart';
import 'app_radio_tile.dart';
import 'profile_icon.dart';

Map<int, String> postTypes = {
  0: 'Poll',
  1: 'Post',
  // 2: 'Quiz',
};

class PostsUtils {
  static AppBar homeAppBar(
      {PreferredSizeWidget? bottom, required BuildContext context}) {
    return AppBar(
      backgroundColor: AppColors.kbrandWhite,
      leadingWidth: 60,
      toolbarHeight: 90,
      leading: const ProfileIcon(),
      title: Container(
        alignment: Alignment.center,
        width: 182,
        height: 48,
        child: TextFormField(
            readOnly: true,
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                enableDrag: true,
                context: context,
                builder: (ctx) {
                  int _value = 0;

                  return StatefulBuilder(
                    builder: (context, useState) {
                      return Container(
                        decoration: ShapeDecoration(
                          color: AppColors.kbrandWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize:
                                MainAxisSize.min, // Wrap content vertically
                            children: [
                              const SizedBox(height: 20),
                              Text('Create Post',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                      )),

                              const SizedBox(height: 20),
                              // Radio button tiles
                              ListTileTheme(
                                child: Column(
                                  children: List.generate(
                                    postTypes.length,
                                    (index) => AppRadioTile(
                                      value: postTypes.keys.toList()[index],
                                      title: postTypes.values.toList()[index],
                                      prefixString: 'Create a',
                                      groupValue: _value,
                                      onChanged: (val) {
                                        useState(() {
                                          _value = val;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: AppButton(
                                  flex: false,
                                  applyInternalPadding: false,
                                  btnText: 'Next',
                                  onTap: () {
                                    Go(
                                      context,
                                      routeName: CreatePost.routeName,
                                      arguments: MyRouteArguments(
                                        arguments: [
                                          {
                                            'postType': postTypes.entries
                                                .where((element) =>
                                                    element.key == _value)
                                                .first
                                                .value
                                          }
                                        ],
                                      ),
                                    ).to();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                  borderRadius: BorderRadius.circular(26),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                  borderRadius: BorderRadius.circular(26),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                  borderRadius: BorderRadius.circular(26),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: AppColors.kerrorColor600),
                  borderRadius: BorderRadius.circular(26),
                ),
                hintText: 'Write a post',
                hintStyle: const TextStyle(
                  color: Color(0xFF8D8D8D),
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ))),
      ),
      bottom: bottom,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
              width: 111,
              height: 32,
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/icons/ninja_flag.svg',
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.kgrayColor700,
                                size: 40,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.kgrayColor100)),
                      child: Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/icons/bi_filter.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
