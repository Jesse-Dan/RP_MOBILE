// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';

import '../../../../../../../logic/services/handler/handlers/loading_handler.dart';
import '../../../../../../../logic/services/logger/logger.dart';
import '../../../../../../../utils/components/app_notifier.dart';
import '../../../../../../../utils/enums/enums.dart';
import '../../../../../../../utils/style/app_colors.dart';
import '../../../fav_post/bloc/fav_post_bloc.dart';
import '../../../fav_post/bloc/fav_post_event.dart';
import '../../../fav_post/bloc/fav_post_state.dart';
import '../../../fav_post/model/fav_post.dart';
import '../../../report/report_view.dart';
import '../../model/post_model.dart';

class PostDetailsMoreOptionsDropdown extends StatelessWidget {
  final Post? post;
  final String imgUrl;

  const PostDetailsMoreOptionsDropdown({
    super.key,
    required this.imgUrl,
    required this.post,
  });

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
          'assets/icons/$imgUrl',
          height: 24,
          width: 24,
        ),
        onSelected: (value) {
          // Handle menu item selection
          if (kDebugMode) {
            print('Selected: $value');
          }
        },
        itemBuilder: (BuildContext context) {
          return PostDetailsTopSectionPopMenuItemModel.data(context, post)
              .map((item) => PopupMenuItem<String>(
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
                  ))
              .toList();
        },
      ),
    );
  }
}

class PostDetailsTopSectionPopMenuItemModel {
  final String img;
  final String text;
  final int? value;
  final VoidCallback? onPressed;

  PostDetailsTopSectionPopMenuItemModel({
    this.value,
    required this.img,
    required this.text,
    this.onPressed,
  });
  static List<PostDetailsTopSectionPopMenuItemModel> data(
          context, Post? post) =>
      [
        PostDetailsTopSectionPopMenuItemModel(
            img: 'solar_star-line-duotone.svg',
            text: 'Add to favourite',
            onPressed: () {
              Logger.log(tag: Tag.DEBUG, message: 'Clicked  ${post!.id}');
              BlocProvider.of<FavPostBloc>(context).add(FavPostAction(
                  FavPostPayload(refId: post.id!, refName: post.postType!)));
              Logger.log(tag: Tag.DEBUG, message: 'Clicked Done ${post.id}');
            }),
        PostDetailsTopSectionPopMenuItemModel(
            img: 'volume-slash.svg', text: 'Mute ${post!.user!.firstName}'),
        PostDetailsTopSectionPopMenuItemModel(
            img: 'gg_close-r.svg', text: 'Block ${post.user!.firstName}'),
        PostDetailsTopSectionPopMenuItemModel(
            img: 'ph_flag.svg',
            text: 'Report',
            onPressed: () {
              Go(context,
                  routeName: Report.routeName,
                  arguments: MyRouteArguments(arguments: [
                    {'post': post}
                  ])).to();
            })
      ];
}
