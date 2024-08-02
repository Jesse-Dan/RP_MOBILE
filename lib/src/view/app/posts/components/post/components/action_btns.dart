// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:recenth_posts/src/logic/services/location_service/local_storage_service.dart';
import 'package:recenth_posts/src/utils/constants/global_constants.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/view/app/posts/components/comment/bloc/comment_bloc.dart';
import 'package:recenth_posts/src/view/app/posts/components/comment/bloc/comment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';
import '../../../../../../logic/models/app/user_model.dart';
import '../../../../../../logic/services/logger/logger.dart';
import '../../../../../../utils/components/action_btn.dart';
import '../../../../../../utils/components/app_notifier.dart';
import '../../../../../../utils/components/share_buttom_sheet.dart';
import '../../comment/components/comment_on_post.dart';
import '../../report/report_view.dart';
import '../../star/bloc/like_bloc.dart';
import '../../star/bloc/like_event.dart';
import '../../star/bloc/like_state.dart';
import '../../star/model/star.dart';
import '../../star/model/star_payload.dart';
import '../model/post_model.dart';
import 'post_drop_down.dart';

class ActionButtons extends StatefulWidget {
  final Post post;

  const ActionButtons({
    super.key,
    required this.post,
  });

  @override
  State<ActionButtons> createState() => _PostMainActionButtonsState();
}

class _PostMainActionButtonsState extends State<ActionButtons> {
  Color? actionBtnColor;

  Color? getLikeButtonColor(Post post) {
    var user = LocalStorageService.getString(GlobalConstants.USER);
    var userId = User.fromJson(json.decode(user)).id;

    bool liked =
        post.stars?.any((element) => element.userId == userId) ?? false;

    return liked ? AppColors.kprimaryColor600 : null;
  }

  void like(Post post) {
    var user = User.getPresentUser();

    bool liked =
        post.stars?.any((element) => element.userId == user.id) ?? false;

    if (!liked) {
      // Like the post
      BlocProvider.of<LikeBloc>(context).add(
        LoadLikeEvent(
          StarPayload(refId: post.id ?? 0, refName: post.postType ?? 'post'),
        ),
      );

      // Add user's like to the post
      post.stars?.add(Star(userId: user.id));

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
      post.stars?.removeWhere((element) => element.userId == user.id);

      // Update icon color
      setState(() {
        actionBtnColor = null; // reset to default color
      });
    }
  }

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
                  /// START ICON AND ACTION BTN
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        child: ActionBtn(
                          color:
                              getLikeButtonColor(widget.post) ?? actionBtnColor,
                          imgUrl: 'solar_star-line-duotone.svg',
                          onPressed: () {
                            setState(() {
                              like(widget.post);
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${widget.post.stars?.length}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),

                  /// COMMENT
                  BlocListener<CommentBloc, CommentState>(
                    listener: (BuildContext context, CommentState state) {
                      if (state is InCommentState) {
                        AppNotifier.notifyAction(context,
                            message: state.genericResponse.message);
                      }

                      if (state is ErrorCommentState) {
                        widget.post.comments
                            ?.remove(widget.post.comments?.last);
                        AppNotifier.notifyAction(context,
                            message: state.errorMessage);
                      }
                    },
                    child: Row(
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
                                    {"post": widget.post}
                                  ])).toAndExpectData();

                              setState(() {});

                              Logger.log(
                                  tag: Tag.SERVICE_ACTION, message: data);
                            } catch (e) {
                              Logger.log(
                                  tag: Tag.ERROR,
                                  error: e,
                                  message: 'Error occurred while commenting');
                            }
                          },
                          imgUrl: 'iconamoon_comment-dots-light.svg',
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${widget.post.comments?.length}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF8D8D8D),
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ActionBtn(
                        imgUrl: 'eye.svg',
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${widget.post.views?.length}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActionBtn(
                  imgUrl: 'ph_flag.svg',
                  onPressed: () {
                    Go(context,
                        routeName: Report.routeName,
                        arguments: MyRouteArguments(arguments: [
                          {'post': widget.post}
                        ])).to();
                  },
                ),
                const SizedBox(width: 8),
                ActionBtn(
                  imgUrl: 'mdi-light_share.svg',
                  onPressed: () {
                    shareBtmSheet(context);
                  },
                ),
                const SizedBox(width: 8),
                PostDropDown(
                  imgUrl: 'mingcute_more-2-line.svg',
                  post: widget.post,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
