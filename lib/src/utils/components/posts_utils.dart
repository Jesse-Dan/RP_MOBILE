import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/view/app/posts/components/comment_on_post.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

import '../style/app_colors.dart';
import 'profile_icon.dart';

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
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0.10,
              )),
        ),
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
