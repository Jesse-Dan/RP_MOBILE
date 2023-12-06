

import 'package:flutter/material.dart';

import '../../../../utils/style/app_colors.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (ctx, i) => Container(
          margin: const EdgeInsets.only(
            right: 12,
          ),
          width: 99,
          height: 32,
          padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: AppColors.kbrandWhite,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 1, color: Color(0xFFEFEFEF)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Technology',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF464646),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
