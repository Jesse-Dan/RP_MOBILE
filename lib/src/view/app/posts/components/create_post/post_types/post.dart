import 'package:flutter/material.dart';

import '../../../../../../utils/components/app_simple_app_bar.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppSimpleAppBar(context, title: 'Create Post'),
    );
  }
}
