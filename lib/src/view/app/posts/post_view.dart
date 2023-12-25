import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/components/posts_utils.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/view/app/posts/components/favorite_post/favorite_view.dart';

import '../../base/base_body.dart';
import '../../base/base_scaffold.dart';
import 'components/all_posts/all_post_view.dart';

class PostView extends StatefulWidget {
  static const String routeName = '/post.view';

  const PostView({
    super.key,
  });

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addAppBar: true,
      appBar: PostsUtils.homeAppBar(
        context: context,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'All Posts',
            ),
            Tab(
              text: 'Favourite Posts',
            ),
          ],
          labelColor: AppColors.kprimaryColor600,
          indicatorColor: AppColors.kprimaryColor600,
          unselectedLabelColor: AppColors.kgrayColor600,
        ),
      ),
      physics: const BouncingScrollPhysics(),
      backgroundColor: AppColors.kbrandWhite,
      body: BaseBody(
        child: TabBarView(
          controller: _tabController,
          children: const [
            AllPostsVIew(),
            FavoritePost(),
          ],
        ),
      ),
    );
  }
}
