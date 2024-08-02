// ignore_for_file: deprecated_member_use

import 'package:recenth_posts/src/logic/services/handler/handlers/loading_handler.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/app/posts/components/fav_post/bloc/fav_post_bloc.dart';
import 'package:recenth_posts/src/view/app/posts/components/fav_post/bloc/fav_post_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../utils/components/app_notifier.dart';
import '../../../../../../utils/style/app_colors.dart';
import '../../fav_post/bloc/fav_post_event.dart';
import '../../fav_post/model/fav_post.dart';
import '../model/post_model.dart';

class PostDropDown extends StatefulWidget {
  final Post? post;
  final String imgUrl;

  const PostDropDown({
    super.key,
    required this.imgUrl,
    this.post,
  });

  @override
  State<PostDropDown> createState() => _PostDropDownState();
}

class _PostDropDownState extends State<PostDropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<FavPostBloc, FavPostState>(
      listener: (context, state) {
        if (state is InFavPostState) {
          AppNotifier.notifyAction(context,
              message: state.genericResponse.message);
        }
        if (state is ErrorFavPostState) {
          AppNotifier.notifyAction(context, message: state.errorMessage);
        }
        if (state is LoadingFavPostState) {
          LoadingHandler(context: context);
        }
      },
      child: PopupMenuButton<String>(
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
          return PostActionMore.data(context, widget.post)
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
      ),
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
  static List<PostActionMore> data(context, Post? post) => [
        PostActionMore(
            img: 'solar_star-line-duotone.svg',
            text: 'Add to favourite',
            onPressed: () {
              Logger.log(tag: Tag.DEBUG, message: 'Clicked  ${post!.id}');
              BlocProvider.of<FavPostBloc>(context).add(FavPostAction(
                  FavPostPayload(refId: post.id!, refName: post.postType!)));
              Logger.log(tag: Tag.DEBUG, message: 'Clicked Done ${post.id}');
            }),
        PostActionMore(
            img: 'lucide_thumbs-down.svg', text: 'Not interested in this'),
      ];
}
