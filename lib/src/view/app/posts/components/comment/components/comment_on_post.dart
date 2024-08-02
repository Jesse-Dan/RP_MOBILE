// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:recenth_posts/src/utils/components/profile_icon.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:recenth_posts/src/view/app/posts/components/comment/bloc/comment_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';
import '../../../../../../logic/models/app/user_model.dart';
import '../../../../../../logic/services/location_service/local_storage_service.dart';
import '../../../../../../utils/constants/global_constants.dart';
import '../../../../../../utils/enums/enums.dart';
import '../../../../../base/base_scaffold.dart';
import '../bloc/comment_bloc.dart';
import '../../post/model/post_model.dart';
import '../model/comment.dart';
import '../model/comment_payload.dart';

class ReplyPost extends StatefulWidget {
  final Post post;
  final CommentType commentType;
  static const String routeName = '/post.create.new';

  const ReplyPost(
      {super.key, required this.post, this.commentType = CommentType.Comment});

  @override
  State<ReplyPost> createState() => _ReplyPostState();
}

class _ReplyPostState extends State<ReplyPost> {
  final TextEditingController replyController = TextEditingController();
  void addComment(String commentText, Post post) {
    var user = LocalStorageService.getString(GlobalConstants.USER);
    var userId = User.fromJson(json.decode(user)).id;

    // Create a new comment
    Comment newComment = Comment(
      comment: commentText,
      userId: userId,
      refId: post.id,
      refName: 'post',
    );

    // Add the new comment to the post locally (optimistic update)
    post.comments?.add(newComment);

    // Notify the bloc to add the comment to the backend
    BlocProvider.of<CommentBloc>(context).add(
      LoadCommentEvent(
        CommentPayload(
            comment: commentText, refId: post.id!, refName: post.postType!),
      ),
    );
  }

  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addAppBar: true,
      addbodyPadding: true,
      appBar: AppBar(
        leadingWidth: 60,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Go(context).pop();
            },
            icon: const Icon(
              Icons.cancel_outlined,
              size: 20,
            )),
        actions: [
          GestureDetector(
            onTap: replyController.text.isEmpty
                ? null
                : () {
                    addComment(replyController.text, widget.post);
                    replyController.clear();
                    Go<String>(context).backWithData(
                        '${widget.commentType.name.toLowerCase()} sent ');
                  },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 32,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: replyController.text.isEmpty
                    ? AppColors.kprimaryColor700.withOpacity(0.5)
                    : AppColors.kprimaryColor700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Post',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${widget.commentType.name}ing on ',
                  style: const TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: widget.post.userId.toString(),
                  style: TextStyle(
                    color: AppColors.kprimaryColor700,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: AppDim.k14),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileIcon(
                margin: EdgeInsets.only(left: 0, top: 15),
              ),
              const SizedBox(width: AppDim.k12),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextFormField(
                      focusNode: focusNode,
                      controller: replyController,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      autofocus: true,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.kgrayColor800),
                      textAlign: TextAlign.start,
                      onChanged: (val) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: 'Post your ${widget.commentType.name}',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        labelText: 'Post your ${widget.commentType.name}',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                color: AppColors.kgrayColor500),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                color: AppColors.kgrayColor500),
                      ),
                      maxLines: 20,
                      minLines: 3,
                      keyboardType: TextInputType.multiline,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
