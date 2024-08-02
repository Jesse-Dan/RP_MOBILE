import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';

import '../../post/components/post_details/post_details.dart';
import '../model/comment.dart';

class CommentContentBody extends StatelessWidget {
  final Comment? comment;
  const CommentContentBody({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: (comment?.comment?.truncateAndAddSeeMore(maxLength: 150)),
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
                      {'comment': comment, 'postCardType': PostCardType.all}
                    ])).onTapRecognizeGesture(),
                text:
                    // 'see more...',
                    (comment?.comment?.length ?? 0) >= 150
                        ? ' see more...'
                        : '',
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
