// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';
import 'package:recenth_posts/src/utils/components/app_divider.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

import '../../../../logic/services/logger/logger.dart';
import '../../../../utils/components/app_notifier.dart';
import '../../../../utils/style/app_dimentions.dart';
import 'comment_on_post.dart';
import 'mains/mains.dart';

var hashtag = ['Election', 'Government', 'Currupt'];

class PostDetailsWidget extends StatefulWidget {
  static const String routeName = '/post.details.view';

  final Post post;
  final PostCardType postCardType;

  const PostDetailsWidget({
    super.key,
    required this.postCardType,
    required this.post,
  });

  @override
  State<PostDetailsWidget> createState() => _PostDetailsWidgetState();
}

class _PostDetailsWidgetState extends State<PostDetailsWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addAppBar: true,
      addbodyPadding: true,
      appbar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kbrandWhite,
        leading: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimentions.k12 * 2),
          child: RouteCrumb(post: widget.post),
        ),
        leadingWidth: MediaQuery.of(context).size.width,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: 400,
          // height: 624,
          padding: const EdgeInsets.all(AppDimentions.k12),
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
            children: [
              PostDetailTopSection(
                post: widget.post,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CategoryChip(
                  post: widget.post,
                ),
              ),
              PostDetailsContentBody(
                post: widget.post,
              ),
              const SizedBox(height: 24),
              HashTags(
                post: widget.post,
              ),
              const SizedBox(height: 24),
              PostImage(post: widget.post),
              const SizedBox(height: 18),
              const PostDetailsDateAndTime(),
              const SizedBox(height: 16),
              AppDivider.build(),
              const SizedBox(height: 7),
              const ProfileDetailStats(),
              const SizedBox(height: 7),
              AppDivider.build(),
              const SizedBox(height: 16),
              SizedBox(
                height: 32,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PostDetailsActionBtn(
                        img: 'solar_star-line-duotone.svg'),
                    PostDetailsActionBtn(
                        onTap: () async {
                          try {
                            String data = await Go<String>(context,
                                routeName: ReplyPost.routeName,
                                arguments: MyRouteArguments(arguments: [
                                  {
                                    "post": widget.post,
                                    'commentType': CommentType.Comment
                                  },
                                ])).toAndExpectData();
                            Logger.log(tag: Tag.SERVICE_ACTION, message: data);

                            AppNotifier.notifyAction(
                                message: data, context: context);

                            Logger.log(
                                tag: Tag.SERVICE_ACTION, message: data);
                          } catch (e) {
                           
                            Logger.log(
                                tag: Tag.ERROR,
                                error: e,
                                message: 'Error occured while commenting');
                          }
                        },
                        img: 'fluent_comment-20-regular.svg'),
                    const PostDetailsActionBtn(img: 'ph_flag.svg'),
                    const PostDetailsActionBtn(img: 'mdi-light_share.svg')
                  ],
                ),
              ),
              const SizedBox(height: 16),
              CommentBox(post: widget.post),
              const SizedBox(height: 16),
              CommentBox(post: widget.post),
              const SizedBox(height: 16),
              CommentBox(post: widget.post),
            ],
          ),
        ),
      ),
    );
  }
}
