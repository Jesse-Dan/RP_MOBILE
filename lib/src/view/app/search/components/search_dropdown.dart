// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/style/app_colors.dart';

class SearchMoreDropDown extends StatefulWidget {
  final String imgUrl;

  const SearchMoreDropDown({
    super.key,
    required this.imgUrl,
  });

  @override
  State<SearchMoreDropDown> createState() => _SearchMoreDropDownState();
}

class _SearchMoreDropDownState extends State<SearchMoreDropDown> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.kbrandWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: SvgPicture.asset(
        'assets/icons/${widget.imgUrl}',
        height: 24,
        width: 24,
      ),
      onSelected: (value) {
        // Handle menu item selection
        if (kDebugMode) {
          print('Selected: $value');
        }
      },
      itemBuilder: (BuildContext _) {
        return PostActionMore.data(context)
            .map(
              (item) => PopupMenuItem<String>(
                onTap: item.onPressed,
                value: item.text,
                child: SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          'assets/icons/${item.img}',
                          height: 24,
                          width: 24,
                          color: AppColors.kblackColor,
                        ),
                      ),
                      Text(
                        item.text,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.kblackColor,
                            ),
                      ),
                    ],
                  ),
                ), // Use the text from the model
              ),
            )
            .toList();
      },
    );
  }
}

class PostActionMore {
  final String img;
  final String text;
  final int? value;
  final VoidCallback? onPressed;

  PostActionMore({
    this.value,
    required this.img,
    required this.text,
    this.onPressed,
  });
  static List<PostActionMore> data(context) => [
        PostActionMore(
            img: 'solar_star-line-duotone.svg',
            text: 'Add to favourite',
            onPressed: () {
            
            }),
        PostActionMore(
            img: 'lucide_thumbs-down.svg', text: 'Not interested in this'),
      ];
}
