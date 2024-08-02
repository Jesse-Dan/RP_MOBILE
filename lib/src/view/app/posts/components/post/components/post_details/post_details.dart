// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:convert';

import 'package:recenth_posts/src/utils/components/app_divider.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/view/app/posts/components/post/components/post_details/post_details_action_btn.dart';
import 'package:recenth_posts/src/view/app/posts/components/post/components/post_details/post_details_top_section.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';
import '../../../../../../../logic/models/app/user_model.dart';
import '../../../../../../../logic/services/location_service/local_storage_service.dart';
import '../../../../../../../logic/services/logger/logger.dart';
import '../../../../../../../utils/components/app_notifier.dart';
import '../../../../../../../utils/components/share_buttom_sheet.dart';
import '../../../../../../../utils/constants/global_constants.dart';
import '../../../../../../../utils/style/app_dimentions.dart';
import '../../../comment/components/comment_box.dart';
import '../../../comment/components/comment_on_post.dart';
import '../../../globals-components/profile_stats_widget.dart';
import '../../../globals-components/route_crumb.dart';
import '../../../polls/polls.dart';
import '../../../report/report_view.dart';
import '../../../star/bloc/like_bloc.dart';
import '../../../star/bloc/like_event.dart';
import '../../../star/bloc/like_state.dart';
import '../../../star/model/star_payload.dart';
import '../../../star/model/star.dart';
import '../../model/post_model.dart';
import 'post_details_content_body.dart';
import 'post_details_datetime.dart';

var hashtag = ['Election', 'Government', 'Currupt'];

class PostDetailsWidget extends StatefulWidget {
  static const String routeName = '/post.details.view';

  final Post post;

  const PostDetailsWidget({
    super.key,
    required this.post,
  });

  @override
  State<PostDetailsWidget> createState() => _PostDetailsWidgetState();
}

class _PostDetailsWidgetState extends State<PostDetailsWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Color? actionBtnColor;

  Color? getLikeButtonColor(Post post) {
    var user = LocalStorageService.getString(GlobalConstants.USER);
    var userId = User.fromJson(json.decode(user)).id;

    bool liked =
        post.stars?.any((element) => element.userId == userId) ?? false;

    return liked ? AppColors.kprimaryColor600 : null;
  }

  void like(Post post) {
    var user = LocalStorageService.getString(GlobalConstants.USER);
    var userId = User.fromJson(json.decode(user)).id;

    bool liked =
        post.stars?.any((element) => element.userId == userId) ?? false;

    if (!liked) {
      // Like the post
      BlocProvider.of<LikeBloc>(context).add(
        LoadLikeEvent(
          StarPayload(refId: post.id ?? 0, refName: post.postType ?? 'post'),
        ),
      );

      // Add user's like to the post
      post.stars?.add(Star(userId: userId));

      // Update icon color
      setState(() {
        actionBtnColor = AppColors.kprimaryColor600;
      });
    } else {
      // Unlike the post
      BlocProvider.of<LikeBloc>(context).add(
        LoadLikeEvent(
          StarPayload(refId: post.id ?? 0, refName: post.postType ?? 'post'),
        ),
      );

      // Remove user's like from the post
      post.stars?.removeWhere((element) => element.userId == userId);

      // Update icon color
      setState(() {
        actionBtnColor = null; // reset to default color
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addAppBar: true,
      addbodyPadding: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kbrandWhite,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDim.k12 * 2),
          child: Hero(
            tag: 'activityChip',
            child: RouteCrumb(
              post: widget.post,
            ),
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: 400,
          // height: 624,
          padding: const EdgeInsets.all(AppDim.k12),
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
            children: [
              PostDetailTopSection(
                post: widget.post,
              ),
              const SizedBox(height: 24),
              Visibility(
                  visible: widget.post.postType == 'poll',
                  child: PollsView(
                    post: widget.post,
                  )),
              Visibility(
                visible: widget.post.postType == 'post',
                child: PostDetailsContentBody(
                  post: widget.post,
                ),
              ),
              const SizedBox(height: 24),
              const PostDetailsDateAndTime(),
              const SizedBox(height: 16),
              AppDivider.build(),
              const SizedBox(height: 7),
              ProfileDetailStats(post: widget.post),
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
                    BlocListener<LikeBloc, LikeState>(
                      listener: (context, state) {
                        if (state is InLikeState) {
                          AppNotifier.notifyAction(context,
                              message: state.genericResponse.message);
                        }

                        if (state is ErrorLikeState) {
                          widget.post.stars?.remove(widget.post.stars?.last);

                          AppNotifier.notifyAction(context,
                              message: state.errorMessage);
                        }
                      },
                      child: PostDetailsActionBtn(
                        color:
                            getLikeButtonColor(widget.post) ?? actionBtnColor,
                        img: 'solar_star-line-duotone.svg',
                        onTap: () {
                          setState(() {
                            like(widget.post);
                          });
                        },
                      ),
                    ),
                    // const PostDetailsActionBtn(
                    //     img: 'solar_star-line-duotone.svg'),
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
                            setState(() {});
                            Logger.log(tag: Tag.SERVICE_ACTION, message: data);

                            AppNotifier.notifyAction(message: data, context);

                            Logger.log(tag: Tag.SERVICE_ACTION, message: data);
                          } catch (e) {
                            Logger.log(
                                tag: Tag.ERROR,
                                error: e,
                                message: 'Error occured while commenting');
                          }
                        },
                        img: 'fluent_comment-20-regular.svg'),
                    PostDetailsActionBtn(
                        img: 'ph_flag.svg',
                        onTap: () {
                          Go(context,
                              routeName: Report.routeName,
                              arguments: MyRouteArguments(arguments: [
                                {'post': widget.post}
                              ])).to();
                        }),
                    PostDetailsActionBtn(
                      img: 'mdi-light_share.svg',
                      onTap: () async {
                        await shareBtmSheet(context);
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.post.comments?.length,
                itemBuilder: (_, i) => CommentBox(
                    post: widget.post, comment: widget.post.comments?[i]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
