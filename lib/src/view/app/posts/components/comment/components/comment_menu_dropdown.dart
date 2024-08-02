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
import '../model/comment.dart';

class CommentDropDown extends StatefulWidget {
  final Comment? comment;
  final String imgUrl;

  const CommentDropDown({
    super.key,
    required this.imgUrl,
    this.comment,
  });

  @override
  State<CommentDropDown> createState() => _CommentDropDownState();
}

class _CommentDropDownState extends State<CommentDropDown> {
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
          return PostActionMore.data(context, widget.comment)
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
  static List<PostActionMore> data(context, Comment? comment) => [
        PostActionMore(
            img: 'solar_star-line-duotone.svg',
            text: 'Add to favourite',
            onPressed: () {
              Logger.log(tag: Tag.DEBUG, message: 'Clicked  ${comment!.id}');
              BlocProvider.of<FavPostBloc>(context).add(FavPostAction(
                  FavPostPayload(refId: comment.id!, refName: 'comment')));
              Logger.log(tag: Tag.DEBUG, message: 'Clicked Done ${comment.id}');
            }),
        PostActionMore(
            img: 'lucide_thumbs-down.svg', text: 'Not interested in this'),
      ];
}
