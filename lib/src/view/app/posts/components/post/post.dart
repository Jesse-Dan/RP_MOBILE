import 'package:recenth_posts/src/view/app/posts/components/post/post_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/enums/enums.dart';
import '../../../../../utils/style/app_colors.dart';
import '../../../../../utils/style/app_dimentions.dart';
import '../globals-components/recent_activities.dart';
import 'model/post_model.dart';

var hashtag = ['Election', 'Government', 'Currupt'];

class PostsView extends StatefulWidget {
  final PostCardType postCardType;
  final List<Post>? posts;

  const PostsView({
    super.key,
    this.postCardType = PostCardType.all,
    required this.posts,
  });

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  Key key = const Key('refreshKey');

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: key,
      children: [
        RefreshIndicator.adaptive(
          key: key,
          color: AppColors.kprimaryColor600,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 4));
          },
          child: ListView.builder(
              itemCount: widget.posts!.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (item, i) {
                return PostWidget(
                  post: widget.posts![i],
                  i: i,
                );
              }),
        ),
        Container(
          color: AppColors.kbrandWhite,
          height: 65,
          child: Column(
            children: [
              (widget.postCardType == PostCardType.all)
                  ? const SizedBox(height: AppDim.k16)
                  : const SizedBox.shrink(),
              (widget.postCardType == PostCardType.all)
                  ? const RecentActivities()
                  : const SizedBox.shrink(),
              const SizedBox(height: AppDim.k16),
            ],
          ),
        ),
      ],
    );
  }
}
