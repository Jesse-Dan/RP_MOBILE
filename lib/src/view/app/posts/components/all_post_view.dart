

import 'package:flutter/material.dart';

import '../../../../utils/style/app_colors.dart';
import '../../../../utils/style/app_dimentions.dart';
import 'categories_list.dart';
import 'post_card.dart';

class AllPostsVIew extends StatefulWidget {
  const AllPostsVIew({
    super.key,
  });

  @override
  State<AllPostsVIew> createState() => _AllPostsVIewState();
}

class _AllPostsVIewState extends State<AllPostsVIew> {
  Key key = const Key('refreshkey');

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: key,
      children: [
        RefreshIndicator(
          key: key,
          color: AppColors.kprimaryColor600,
          onRefresh: () async {},
          child:  PostCard(),
        ),
        Container(
          color: AppColors.kbrandWhite,
          height: 65,
          child: const Column(
            children: [
              SizedBox(height: AppDimentions.k16),
              Categories(),
              SizedBox(height: AppDimentions.k16),
            ],
          ),
        ),
      ],
    );
  }
}