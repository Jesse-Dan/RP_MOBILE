import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/app/posts/components/all_posts/all_post_widget.dart';

import '../../../../../logic/models/app/post/data.dart';
import '../../../../../utils/style/app_colors.dart';

class FavoritePost extends StatelessWidget {
  const FavoritePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RefreshIndicator(
      key: key,
      color: AppColors.kprimaryColor600,
      onRefresh: () async {},
      child: ListView.builder(
          itemCount: PostData.generate().length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (item, i) {
            return AllPostWidget(
              postCardType: PostCardType.fav,
              post: PostData.generate()[i],
              i: i,
            );
          }),
    ));
  }
}
