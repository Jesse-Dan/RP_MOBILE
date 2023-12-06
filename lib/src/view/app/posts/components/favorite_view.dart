import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/app/posts/components/post_card.dart';

import '../../../../utils/style/app_colors.dart';

class FavoritePost extends StatelessWidget {
  const FavoritePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RefreshIndicator(
      key: key,
      color: AppColors.kprimaryColor600,
      onRefresh: () async {},
      child: const PostCard(
        postCardType: PostCardType.fav,
        
      ),
    ));
  }
}
