
import 'package:flutter/material.dart';

import '../../../comment/model/comment.dart';
import '../../model/post_model.dart';

class PostDetailsContentBody extends StatelessWidget {
  final Post? post;
  final Comment? comment;

  const PostDetailsContentBody({
    super.key,
    required this.post,
    this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        ((post == null) ? comment?.comment : post?.content) ?? '',
        style: const TextStyle(
          color: Color(0xFF0B0B0B),
          fontSize: 14,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
