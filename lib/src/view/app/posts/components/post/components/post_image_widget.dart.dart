import 'package:flutter/material.dart';
import '../../../../../../utils/style/app_dimentions.dart';
import '../model/post_model.dart';
import 'post_image.dart';


class PostImage extends StatelessWidget {
  final Post post;

  const PostImage({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 334,
        height: 250,
        child: GridView.builder(
          key: key,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: AppDim.k12, // Spacing between items
            mainAxisSpacing: AppDim.k12,
          ),
          itemBuilder: (context, index) =>
              (post.link?.length == 3 && index == 0)
                  ? const FirstPostImageWidget(
                      images: [
                        'https://via.placeholder.com/38x38',
                        'https://via.placeholder.com/38x38'
                      ],
                    )
                  : const PostImageWidget(
                      img: 'https://via.placeholder.com/38x38',
                    ),
        ));
  }
}