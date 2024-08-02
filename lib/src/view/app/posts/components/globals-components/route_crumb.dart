import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';

import '../comment/model/comment.dart';
import '../post/model/post_model.dart';
import 'recent_activity_chip.dart';

class RouteCrumb extends StatelessWidget {
  const RouteCrumb({
    super.key,
    this.post,
    this.comment,
  });

  final Post? post;
  final Comment? comment;
  @override
  Widget build(BuildContext context) {
    return BreadCrumb(items: [
      BreadCrumbItem(
          onTap: () {
            Go(context).pop();
          },
          content: RecentActivityChip(
            txtColor: AppColors.kgrayColor700,
            chipColor: Colors.transparent,
            img: SvgPicture.asset(
              'assets/icons/carbon_home.svg',
              height: 16,
              width: 16,
            ),
            val: 'Home',
          )),
      BreadCrumbItem(
          onTap: () {},
          content: RecentActivityChip(
            post: post,
            img: SvgPicture.asset(
              'assets/icons/chevron-right.svg',
              height: 16,
              width: 16,
            ),
          ))
    ]);
  }
}
