import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  const ProfileIcon({
    super.key,
    this.margin,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(left: 15),
      height: height ?? 48,
      width: width ?? 48,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                'http://via.placeholder.com/30',
              ))),
    );
  }
}
