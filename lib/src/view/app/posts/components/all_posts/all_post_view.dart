import 'package:flutter/material.dart';

import '../../../../../logic/models/app/post/data.dart';
import '../../../../../utils/enums/enums.dart';
import '../../../../../utils/style/app_colors.dart';
import '../../../../../utils/style/app_dimentions.dart';
import '../categories_list.dart';
import 'all_post_widget.dart';

var hashtag = ['Election', 'Government', 'Currupt'];

class AllPostsVIew extends StatefulWidget {
  final PostCardType postCardType;

  const AllPostsVIew({
    super.key,
    this.postCardType = PostCardType.defaultt,
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
          child: ListView.builder(
              itemCount: PostData.generate().length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (item, i) {
                return AllPostWidget(
                  postCardType: widget.postCardType,
                  post: PostData.generate()[i],
                  i: i,
                );
              }),
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
