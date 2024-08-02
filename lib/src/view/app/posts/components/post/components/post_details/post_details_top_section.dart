import 'package:recenth_posts/src/utils/extensions/extensions.dart';
import 'package:recenth_posts/src/view/app/posts/components/post/components/post_details/post_details_more_drop_down.dart';
import 'package:flutter/material.dart';
import '../../../comment/model/comment.dart';
import '../../model/post_model.dart';

class PostDetailTopSection extends StatefulWidget {
  final Post? post;
  final Comment? comment;

  const PostDetailTopSection({
    super.key,
    required this.post,
    this.comment,
  });

  @override
  State<PostDetailTopSection> createState() => _PostDetailTopSectionState();
}

class _PostDetailTopSectionState extends State<PostDetailTopSection> {
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
            height: 38,
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
                const SizedBox(width: 12),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Pamela Loyes',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: (widget.post == null)
                            ? widget.comment?.comment?.truncateAndAddSeeMore(
                                maxLength: 15, trancatedText: '...')
                            : widget.post?.content?.truncateAndAddSeeMore(
                                maxLength: 15, trancatedText: '...'),
                        style: const TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                PostDetailsMoreOptionsDropdown(
                  imgUrl: 'mingcute_more-2-line.svg',
                  post: widget.post,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
