// ignore_for_file: deprecated_member_use

import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileIcon extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final String imageUrl;
  const ProfileIcon({
    super.key,
    this.margin,
    this.height,
    this.width,
    this.imageUrl = '.',
  });

  @override
  State<ProfileIcon> createState() => _ProfileIconState();
}

class _ProfileIconState extends State<ProfileIcon> {
  bool isTest = false;
  @override
  Widget build(BuildContext context) {
    if (isTest) {
      return Container(
          height: 48,
          width: 48,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(width: 1, color: AppColors.kprimaryColor400),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.person_2_rounded,
              size: 32,
              color: AppColors.kprimaryColor600,
            ),
          ));
    }
    switch (widget.imageUrl.split('.')[1]) {
      case 'svg':
        return Container(
            height: 48,
            width: 48,
            padding: const EdgeInsets.all(AppDim.k12),
            decoration: const ShapeDecoration(
              shape: OvalBorder(
                side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
              ),
            ),
            child: SvgPicture.asset(
              'assets/icons/${widget.imageUrl}',
              height: widget.height ?? 24,
              width: widget.width ?? 24,
              color: AppColors.kprimaryColor600,
            ));
      case 'png':
        return Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.kgrayColor200)),
          child: Image.asset(
            'assets/icons/${widget.imageUrl}',
            height: widget.height ?? 24,
            width: widget.width ?? 24,
            color: AppColors.kprimaryColor600,
          ),
        );
      default:
        return Container(
          margin: widget.margin ?? const EdgeInsets.only(left: 15),
          height: widget.height ?? 48,
          width: widget.width ?? 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                'http://via.placeholder.com/30x30',
              ),
            ),
          ),
        );
    }
  }
}
