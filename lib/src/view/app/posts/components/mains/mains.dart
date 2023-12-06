// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/extensions/extensions.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../../../../logic/services/logger/logger.dart';
import '../../../../../utils/components/action_btn.dart';
import '../../../../../utils/components/app_notifier.dart';
import '../../../../../utils/style/app_dimentions.dart';
import '../comment_on_post.dart';
import '../post_details.dart';

// class CommentClickFIeld extends StatelessWidget {
//   final Post post;
//   const CommentClickFIeld({
//     super.key,
//     required this.post,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Go(context,
//             routeName: ReplyPost.routeName,
//             arguments: MyRouteArguments(arguments: [
//               {"post": post}
//             ])).to();
//       },
//       child: Container(
//         height: 50,
//         // width: 40,
//         margin: const EdgeInsets.only(bottom: 16, left: 10, right: 10),
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
//         clipBehavior: Clip.antiAlias,
//         decoration: ShapeDecoration(
//           color: AppColors.kgrayColor100,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//         ),
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Post your Comment',
//             style: TextStyle(
//               color: AppColors.kgrayColor800,
//               fontSize: 16,
//               fontFamily: 'DM Sans',
//               fontWeight: FontWeight.w400,
//             ),
//             textAlign: TextAlign.left,
//           ),
//         ),
//       ),
//     );
//   }
// }

class CommentBox extends StatelessWidget {
  final Post post;
  const CommentBox({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 382,
      padding: const EdgeInsets.all(AppDimentions.k12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFEFEFEF)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          TopSection(post: post),
          const SizedBox(height: 24),
          ContentBody(
            post: post,
          ),
          const SizedBox(height: 16),
          CommentBoxActionBtns(post: post)
        ],
      ),
    );
  }
}

class PostDetailsActionBtn extends StatelessWidget {
  final String img;
  final void Function()? onTap;
  const PostDetailsActionBtn({
    super.key,
    required this.img,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 32,
        height: 32,
        decoration: const ShapeDecoration(
          color: Color(0xFFF7F7F7),
          shape: OvalBorder(),
        ),
        child: SizedBox(
          height: 16,
          width: 16,
          child: SvgPicture.asset(
            'assets/icons/$img',
            color: AppColors.kblackColor,
          ),
        ),
      ),
    );
  }
}

class PostDetailsDateAndTime extends StatelessWidget {
  const PostDetailsDateAndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '02:30',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8D8D8D),
              fontSize: 16,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 2,
            height: 2,
            decoration: const ShapeDecoration(
              color: Color(0xFF6A6A6A),
              shape: OvalBorder(),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            '27/10/2023',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8D8D8D),
              fontSize: 16,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileDetailStats extends StatelessWidget {
  const ProfileDetailStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 24,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '28k',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  'Views',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '2k',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  'Ratting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '10k',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),
                Text(
                  'Comments',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RouteCrumb extends StatelessWidget {
  const RouteCrumb({
    super.key,
    required this.post,
  });

  final Post post;
  @override
  Widget build(BuildContext context) {
    return BreadCrumb(items: [
      BreadCrumbItem(
          onTap: () {
            Go(context).pop();
          },
          content: CategoryChip(
            txtColor: AppColors.kgrayColor700,
            chipColor: Colors.transparent,
            img: SvgPicture.asset(
              'assets/icons/carbon_home.svg',
              height: 16,
              width: 16,
            ),
            val: 'Home',
          )),
      BreadCrumbItem(
          onTap: () {},
          content: CategoryChip(
            post: post,
            img: SvgPicture.asset(
              'assets/icons/chevron-right.svg',
              height: 16,
              width: 16,
            ),
          ))
    ]);
  }
}

class PostImage extends StatelessWidget {
  final Post post;

  const PostImage({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return post.images!.isEmpty
        ? const SizedBox.shrink()
        : SizedBox(
            width: 334,
            height: post.images!.length == 2 ? 170 : 340,
            child: GridView.builder(
              key: key,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: post.images?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    post.images!.length == 1 ? 1 : 2, // Number of columns
                crossAxisSpacing: AppDimentions.k12, // Spacing between items
                mainAxisSpacing: AppDimentions.k12,
              ),
              itemBuilder: (context, index) => PostImageWidget(
                post: post,
              ),
            ));
  }
}

class PostImageWidget extends StatelessWidget {
  final Post post;
  const PostImageWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 140,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: NetworkImage("https://via.placeholder.com/163x140"),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}

class CommentBoxActionBtns extends StatelessWidget {
  final Post post;

  const CommentBoxActionBtns({
    super.key,
    required this.post,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 334,
      height: 24,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionBtn(
                        imgUrl: 'solar_star-line-duotone.svg',
                      ),
                      SizedBox(width: 3),
                      Text(
                        '4k',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionBtn(
                        onPressed: () async {
                          try {
                            String data = await Go<String>(context,
                                routeName: ReplyPost.routeName,
                                arguments: MyRouteArguments(arguments: [
                                  {
                                    "post": post,
                                    'commentType': CommentType.Reply
                                  },
                                ])).toAndExpectData();
                            Logger.log(tag: Tag.SERVICE_ACTION, message: data);

                            AppNotifier.notifyAction(
                                message: data, context: context);

                            Logger.log(tag: Tag.SERVICE_ACTION, message: data);
                          } catch (e) {
                            Logger.log(
                                tag: Tag.ERROR,
                                error: e,
                                message: 'Error occured while commenting');
                          }
                        },
                        imgUrl: 'iconamoon_comment-dots-light.svg',
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        '5k',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionBtn(
                        imgUrl: 'eye.svg',
                      ),
                      SizedBox(width: 3),
                      Text(
                        '20k',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActionBtn(imgUrl: 'ph_flag.svg'),
                SizedBox(width: 8),
                ActionBtn(imgUrl: 'mdi-light_share.svg'),
                SizedBox(width: 8),
                ActionBtn(imgUrl: 'mingcute_more-2-line.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActionBtns extends StatelessWidget {
  final Post post;

  const ActionBtns({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 334,
      height: 24,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionBtn(
                        imgUrl: 'solar_star-line-duotone.svg',
                      ),
                      SizedBox(width: 3),
                      Text(
                        '4k',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionBtn(
                        onPressed: () async {
                          try {
                            String data = await Go<String>(context,
                                routeName: ReplyPost.routeName,
                                arguments: MyRouteArguments(arguments: [
                                  {"post": post}
                                ])).toAndExpectData();
                            Logger.log(tag: Tag.SERVICE_ACTION, message: data);

                            AppNotifier.notifyAction(
                                message: data, context: context);

                            Logger.log(tag: Tag.SERVICE_ACTION, message: data);
                          } catch (e) {
                            Logger.log(
                                tag: Tag.ERROR,
                                error: e,
                                message: 'Error occured while commenting');
                          }
                        },
                        imgUrl: 'iconamoon_comment-dots-light.svg',
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        '5k',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionBtn(
                        imgUrl: 'eye.svg',
                      ),
                      SizedBox(width: 3),
                      Text(
                        '20k',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActionBtn(imgUrl: 'ph_flag.svg'),
                SizedBox(width: 8),
                ActionBtn(imgUrl: 'mdi-light_share.svg'),
                SizedBox(width: 8),
                ActionBtn(imgUrl: 'mingcute_more-2-line.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HashTags extends StatelessWidget {
  final Post post;

  const HashTags({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 258,
        height: 20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: post.hashTags?.length,
          itemBuilder: (ctx, i) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '#${post.hashTags![i].name} ',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFD75B6B),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class PostDetailsContentBody extends StatelessWidget {
  final Post post;
  const PostDetailsContentBody({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        post.content!,
        style: const TextStyle(
          color: Color(0xFF0B0B0B),
          fontSize: 16,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final Widget? img;
  final Color? txtColor;
  final Color? chipColor;
  final Post? post;
  final String? val;

  const CategoryChip({
    super.key,
    this.post,
    this.val,
    this.txtColor,
    this.img,
    this.chipColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 24),
      padding: const EdgeInsets.symmetric(
          vertical: AppDimentions.k12 - 8, horizontal: AppDimentions.k12 - 6),
      decoration: BoxDecoration(
        color: chipColor ?? const Color(0xFF6840C6).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: img == null
          ? Text(
              val ?? post?.category ?? 'All',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: txtColor ?? const Color(0xFF6840C6),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                img!,
                const SizedBox(width: 8),
                Text(
                  val ?? post?.category ?? 'All',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: txtColor ?? const Color(0xFF6840C6),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
    );
  }
}

class PostDetailTopSection extends StatefulWidget {
  final Post post;

  const PostDetailTopSection({
    super.key,
    required this.post,
  });

  @override
  State<PostDetailTopSection> createState() => _PostDetailTopSectionState();
}

class _PostDetailTopSectionState extends State<PostDetailTopSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            width: 244,
            height: 38,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/38x38"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                const SizedBox(width: 12),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Pamela Loyes',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: widget.post.user!.userId,
                        style: const TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                ActionBtn(
                  imgUrl: '',
                  child: PopupMenuButton<String>(
                    color: AppColors.kbrandWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    icon: SvgPicture.asset(
                      'assets/icons/mingcute_more-2-line.svg',
                      height: 24,
                      width: 24,
                    ),
                    onSelected: (value) {
                      // Handle menu item selection
                      print('Selected: $value');
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ContentBody extends StatelessWidget {
  final Post post;
  const ContentBody({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: post.content!
                  .truncateAndAddSeeMore(maxLength: 150)
                  .split('...')[0],
              style: const TextStyle(
                color: Color(0xFF0B0B0B),
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
                spellOut: true,
                semanticsLabel: 'see more',
                recognizer: Go(context,
                    routeName: PostDetailsWidget.routeName,
                    arguments: MyRouteArguments(arguments: [
                      {'post': post, 'postCardType': PostCardType.defaultt}
                    ])).onTapRecognizeGesture(),
                text:
                    "...${post.content!.truncateAndAddSeeMore(maxLength: 150).split('...')[1]}",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: const Color(0xFFB0B0B0),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  final Post post;

  const TopSection({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            width: 244,
            height: 38,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/38x38"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                const SizedBox(width: 12),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Pamela Loyes',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                      const TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                      TextSpan(
                        text: post.user!.userId,
                        style: const TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                const Text(
                  '2h ago',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
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
