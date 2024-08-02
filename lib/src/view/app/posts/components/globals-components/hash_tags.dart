import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:flutter/material.dart';

import '../post/components/post_details/post_details.dart';
import '../post/model/post_model.dart';

class HashTags extends StatelessWidget {
  final Post post;

  const HashTags({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hashtag.length,
          itemBuilder: (ctx, i) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '#${hashtag[i]} ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.kprimaryColor700,
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
