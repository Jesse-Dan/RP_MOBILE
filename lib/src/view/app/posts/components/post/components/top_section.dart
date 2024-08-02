import 'package:recenth_posts/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class TopSection extends StatelessWidget {
  final Post post;

  const TopSection({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            width: 244,
            // height: 38,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/38x38"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                const SizedBox(width: 10),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${post.user!.firstName} ${post.user!.lastName}'
                            .truncateAndAddSeeMore(
                                maxLength: 20, trancatedText: '...'),
                        style: const TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(
                        text: '\n',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'post.user!.school?.name',
                        style: const TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 12,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                const Spacer(),
                const Text(
                  '2h ago',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
