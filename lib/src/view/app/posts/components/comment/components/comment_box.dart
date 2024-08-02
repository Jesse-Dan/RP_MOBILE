import 'package:flutter/material.dart';
import '../../../../../../utils/style/app_dimentions.dart';
import '../../post/components/top_section.dart';
import '../../post/model/post_model.dart';
import '../model/comment.dart';
import 'comment_box_action_btn.dart';
import 'comment_content_body.dart';

class CommentBox extends StatelessWidget {
  final Comment? comment;
  final Post post;
  const CommentBox({
    super.key,
    required this.comment,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 382,
      margin: const EdgeInsets.symmetric(vertical: AppDim.k18 - 12),
      padding: const EdgeInsets.symmetric(
          horizontal: AppDim.k12, vertical: AppDim.k16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFEFEFEF)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          TopSection(post: post),
          const SizedBox(height: 24),
          CommentContentBody(
            comment: comment,
          ),
          const SizedBox(height: 16),
          CommentBoxActionBtns(post: post, comment: comment,)
        ],
      ),
    );
  }
}
