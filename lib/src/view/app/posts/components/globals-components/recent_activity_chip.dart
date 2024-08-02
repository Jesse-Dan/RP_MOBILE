import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../utils/style/app_dimentions.dart';
import '../comment/model/comment.dart';
import '../post/model/post_model.dart';

class RecentActivityChip extends StatelessWidget {
  final Widget? img;
  final Color? txtColor;
  final Color? chipColor;
  final Post? post;

  final Comment? comment;
  final String? val;

  const RecentActivityChip({
    super.key,
    this.post,
    this.val,
    this.txtColor,
    this.img,
    this.chipColor,
    this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 12),
      padding: const EdgeInsets.symmetric(
          vertical: AppDim.k12 - 8, horizontal: AppDim.k12 - 6),
      decoration: BoxDecoration(
        color: chipColor ?? const Color(0xFF6840C6).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: img == null
          ? Text(
              post?.postType == 'quiz'
                  ? 'Quiz'
                  : post?.postType == 'poll'
                      ? 'Poll'
                      : post?.subject ?? 'Home',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: txtColor ?? const Color(0xFF6840C6),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                img!,
                const SizedBox(width: 8),
                Text(
                  post?.postType == 'quiz'
                      ? 'Quiz'
                      : post?.postType == 'poll'
                          ? 'Poll'
                          : post?.subject ?? 'Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: txtColor ?? const Color(0xFF6840C6),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
    ).animate().slideX(
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceInOut);
  }
}
