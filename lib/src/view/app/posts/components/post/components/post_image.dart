import 'package:flutter/material.dart';


class PostImageWidget extends StatelessWidget {
  final String img;
  final double? height;
  const PostImageWidget({
    super.key,
    this.height,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: height ?? 140,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}

class FirstPostImageWidget extends StatelessWidget {
  final List<String> images;
  const FirstPostImageWidget({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 160,
          // height: 280,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage(images[0]),
              fit: BoxFit.fill,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PostImageWidget(
              img: images[1],
              height: 160,
            ),
            PostImageWidget(
              img: images[2],
              height: 160,
            ),
          ],
        ),
      ],
    );
  }
}
