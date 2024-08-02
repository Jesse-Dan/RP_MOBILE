import 'package:flutter/material.dart';

import '../post/model/post_model.dart';


class ProfileDetailStats extends StatelessWidget {
  final Post post;
  const ProfileDetailStats({
    super.key, required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 24,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${post.views?.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 3),
                const Text(
                  'Views',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${post.stars?.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 3),
                const Text(
                  'Stars',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${post.comments?.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 3),
                const Text(
                  'Comments',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
