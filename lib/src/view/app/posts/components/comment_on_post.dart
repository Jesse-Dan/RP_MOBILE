// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';
import 'package:recenth_posts/src/logic/models/app/post/res/get_all_post_response.dart';
import 'package:recenth_posts/src/utils/components/profile_icon.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:recenth_posts/src/view/base/base_app.dart';

import '../../../../utils/enums/enums.dart';
import '../../../base/base_scaffold.dart';

class ReplyPost extends StatefulWidget {
  final Post post;
  final CommentType commentType;
  static const String routeName = '/post.create.new';

  ReplyPost(
      {super.key, required this.post, this.commentType = CommentType.Comment});

  @override
  State<ReplyPost> createState() => _ReplyPostState();
}

class _ReplyPostState extends State<ReplyPost> {
  final TextEditingController replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addAppBar: true,
      addbodyPadding: true,
      appbar: AppBar(
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
                    Go<String>(
                      context,
                      routeName: BaseApp.routeName,
                      arguments: MyRouteArguments(
                        arguments: [
                          {'newPost': widget.post, "currentIndex": 0}
                        ],
                      ),
                    ).backWithData(
                        '${widget.commentType.name.toLowerCase()} sent ');
                  },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: 58,
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
                      fontFamily: 'Inter',
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
                  text: widget.post.user?.userId,
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
          const SizedBox(height: AppDimentions.k14),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileIcon(
                margin: EdgeInsets.only(left: 0, top: 15),
              ),
              const SizedBox(width: AppDimentions.k12),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextFormField(
                      controller: replyController,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      autofocus: true,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
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
                            .subtitle2!
                            .copyWith(
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                color: AppColors.kgrayColor500),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .subtitle2!
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
