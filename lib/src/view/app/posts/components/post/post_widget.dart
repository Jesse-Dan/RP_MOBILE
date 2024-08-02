import 'dart:async';

import 'package:recenth_posts/src/logic/models/app/user_model.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/app/posts/components/polls/polls.dart';
import 'package:recenth_posts/src/view/app/posts/components/view/bloc/view_bloc.dart';
import 'package:recenth_posts/src/view/app/posts/components/view/bloc/view_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';
import '../../../../../utils/components/share_buttom_sheet.dart';
import '../../../../../utils/style/app_dimentions.dart';
import '../globals-components/hash_tags.dart';
import '../globals-components/recent_activity_chip.dart';
import '../view/model/view.dart' as view;
import '../view/model/view_payload.dart';
import 'components/action_btns.dart';
import 'components/post_content_body.dart';
import 'components/post_details/post_details.dart';
import 'components/post_image_widget.dart.dart';
import 'components/top_section.dart';
import 'model/post_model.dart';

var hashtag = ['Election', 'Government', 'Currupt'];

class PostWidget extends StatefulWidget {
  final int i;
  final Post? post;
  const PostWidget({
    super.key,
    required this.i,
    required this.post,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  void incrementViewCount(Post post) {
    var user = User.getPresentUser();
    var userId = user.id;

    bool hasViewed = post.views?.any((view) => view.userId == userId) ?? false;

    if (!hasViewed) {
      // Add the view for the user
      post.views?.add(
          view.View(refId: post.id, refName: post.postType, userId: userId));

      BlocProvider.of<ViewBloc>(context).add(LoadViewEvent(
          ViewPayload(refId: post.id!, refName: widget.post!.postType!)));

      // Update the view count
      post.views?.length =
          post.views?.length ?? 0 + 1; // Increment the view count
    }
  }

  late Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer(widget.post!);
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  /// timer for post to mark user as viewed post
  void startTimer(Post post) {
    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        incrementViewCount(post);
      });
    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Go(context,
            routeName: PostDetailsWidget.routeName,
            arguments: MyRouteArguments(arguments: [
              {'post': widget.post, 'postCardType': PostCardType.all}
            ])).to();
      },
      onLongPress: () {
        shareBtmSheet(context);
      },
      child: Container(
        margin: widget.i == 0
            ? const EdgeInsets.only(top: 84, bottom: AppDim.k12 - 4)
            : const EdgeInsets.symmetric(vertical: AppDim.k12 - 4),
        width: 400,
        // height: 624,
        padding: const EdgeInsets.all(AppDim.k12),
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
              post: widget.post!,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Hero(
                tag: 'activityChip',
                child: RecentActivityChip(
                  post: widget.post,
                ),
              ),
            ),
            ContentBody(
              post: widget.post!,
            ),
            Visibility(
                visible: widget.post?.postType == 'post',
                child: const SizedBox(height: 24)),
            Visibility(
              visible: widget.post?.postType == 'post',
              child: HashTags(
                post: widget.post!,
              ),
            ),
            Visibility(
              visible: widget.post?.postType == 'post',
              child: const SizedBox(height: 24),
            ),
            Visibility(
                visible: widget.post?.postType == 'poll',
                child: PollsView(
                  post: widget.post!,
                )),
            Visibility(
              visible: widget.post?.postType == 'post',
              child: PostImage(post: widget.post!),
            ),
            const SizedBox(height: 18),
            ActionButtons(
              post: widget.post!,
            )
          ],
        ),
      ),
    );
  }
}
