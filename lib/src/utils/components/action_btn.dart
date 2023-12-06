import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String imgUrl;
  final Widget? child;
  const ActionBtn({
    super.key,
    this.onPressed,
    required this.imgUrl,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: child ??
          SvgPicture.asset(
            'assets/icons/$imgUrl',
            height: 24,
            width: 24,
          ),
    );
  }
}
