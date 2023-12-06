import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class ProfileIcon extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  const ProfileIcon({
    super.key, this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:margin?? const EdgeInsets.only(left: 15),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppColors.kprimaryColor400),
    );
  }
}
