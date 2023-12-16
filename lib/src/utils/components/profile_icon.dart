import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';

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
  @override
  Widget build(BuildContext context) {
    return widget.imageUrl.contains('svg')
        ? Container(
            height: 48,
            width: 48,
            padding: const EdgeInsets.all(AppDimentions.k12),
            decoration: const ShapeDecoration(
              shape: OvalBorder(
                side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
              ),
            ),
            child: SvgPicture.asset(
              'assets/icons/${widget.imageUrl}',
              height: widget.height ?? 24,
              width: widget.width ?? 24,
            ))
        : widget.imageUrl.contains('png')
            ? Container(
                height: 48,
                width: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                // border: Border.all(color: AppColors.kgrayColor200)),
                child: Image.asset(
                  'assets/icons/${widget.imageUrl}',
                  height: widget.height ?? 24,
                  width: widget.width ?? 24,
                ),
              )
            : Container(
                margin: widget.margin ?? const EdgeInsets.only(left: 15),
                height: widget.height ?? 48,
                width: widget.width ?? 48,
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
