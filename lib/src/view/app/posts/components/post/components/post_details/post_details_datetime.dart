import 'package:flutter/material.dart';



class PostDetailsDateAndTime extends StatelessWidget {
  const PostDetailsDateAndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '02:30',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8D8D8D),
              fontSize: 14,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 2,
            height: 2,
            decoration: const ShapeDecoration(
              color: Color(0xFF6A6A6A),
              shape: OvalBorder(),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            '27/10/2023',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8D8D8D),
              fontSize: 14,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
