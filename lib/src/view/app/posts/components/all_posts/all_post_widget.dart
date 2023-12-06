import 'package:flutter/material.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../../../../utils/style/app_dimentions.dart';
import '../mains/mains.dart';

var hashtag = ['Election', 'Government', 'Currupt'];

class AllPostWidget extends StatelessWidget {
  final int i;
  final Post post;
  const AllPostWidget({
    super.key,
    required this.postCardType,
    required this.i,
    required this.post,
  });

  final PostCardType postCardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: postCardType == PostCardType.fav
          ? const EdgeInsets.symmetric(vertical: AppDimentions.k12 - 4)
          : i == 0
              ? const EdgeInsets.only(top: 84, bottom: AppDimentions.k12 - 4)
              : const EdgeInsets.symmetric(vertical: AppDimentions.k12 - 4),
      width: 400,
      // height: 624,
      padding: const EdgeInsets.all(AppDimentions.k12),
      decoration: ShapeDecoration(
        // color: AppColors.kerrorColor300,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFEFEFEF)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          TopSection(
            post: post,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CategoryChip(
              post: post,
            ),
          ),
          ContentBody(
            post: post,
          ),
          const SizedBox(height: 24),
          HashTags(
            post: post,
          ),
          const SizedBox(height: 24),
          PostImage(post: post),
          const SizedBox(height: 18),
          ActionBtns(
            post: post,
          )
        ],
      ),
    );
  }
}
