import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/extensions/extensions.dart';
import 'package:recenth_posts/src/view/app/posts/components/post/components/post_details/post_details.dart';
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';

import '../model/post_model.dart';

class ContentBody extends StatelessWidget {
  final Post post;
  const ContentBody({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: (post.content
                      ?.truncateAndAddSeeMore(maxLength: 150)
                      .split('...')[0] ??
                  ''),
              style: const TextStyle(
                color: Color(0xFF0B0B0B),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
                spellOut: true,
                semanticsLabel: 'see more',
                recognizer: Go(context,
                    routeName: PostDetailsWidget.routeName,
                    arguments: MyRouteArguments(arguments: [
                      {'post': post, 'postCardType': PostCardType.all}
                    ])).onTapRecognizeGesture(),
                text: post.content == null
                    ? ''
                    : "...${post.content?.truncateAndAddSeeMore(maxLength: 150).split('...')[1]}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color(0xFFB0B0B0),
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
