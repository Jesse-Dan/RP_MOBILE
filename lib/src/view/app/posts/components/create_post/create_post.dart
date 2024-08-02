import 'package:flutter/material.dart';

import 'post_types/poll.dart';
import 'post_types/post.dart';

class CreatePost extends StatefulWidget {
  static const String routeName = '/CreatePost';

  final String postType;
  const CreatePost({super.key, required this.postType});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.postType) {
      'Post' => const Post(),
      'Poll' => const Poll(),
      _ => ErrorWidget(Exception('Feature Not Implemented'))
    };
  }
}
