import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/components/app_custom_loader.dart';
import 'package:recenth_posts/src/utils/components/app_notifier.dart';
import 'package:recenth_posts/src/utils/components/posts_utils.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../base/base_body.dart';
import '../../base/base_scaffold.dart';
import 'components/post/bloc/get_post_bloc_bloc.dart';
import 'components/post/bloc/get_post_bloc_event.dart';
import 'components/post/bloc/get_post_bloc_state.dart';
import 'components/post/post.dart';

class PostView extends StatefulWidget {
  static const String routeName = '/post.view';

  const PostView({
    super.key,
  });

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<GetPostBlocBloc>(context).add(LoadGetPostBlocEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetPostBlocBloc, GetPostBlocState>(
        listener: (context, state) {
      if (state is GetPostSucessfulState) {
        AppNotifier.notifyAction(context, message: 'New Posts');
        Logger.log(tag: Tag.DEBUG, message: state.toString());
      }

      if (state is ErrorGetPostBlocState) {
        Logger.log(tag: Tag.DEBUG, message: state.errorMessage);
        AppNotifier.notifyAction(context, message: 'failed to load posts');
      }

      if (state is GetPostLoadingState) {
        Logger.log(tag: Tag.DEBUG, message: state.toString());
        AppNotifier.notifyAction(context, message: 'fetching post');
      }
    }, builder: (BuildContext context, GetPostBlocState state) {
      if (state is GetPostLoadingState) {
        Logger.log(tag: Tag.DEBUG, message: state.toString());
        return AppLoadingIndicator();
      }
      if (state is GetPostSucessfulState) {
        return BaseScaffold(
          addAppBar: true,
          appBar: PostsUtils.homeAppBar(
            context: context,
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'MyCampus',
                ),
                Tab(
                  text: 'Personal Feed',
                ),
              ],
              labelColor: AppColors.kprimaryColor600,
              indicatorColor: AppColors.kprimaryColor600,
              unselectedLabelColor: AppColors.kgrayColor600,
            ),
          ),
          refreshable: true,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 4));
          },
          physics: const NeverScrollableScrollPhysics(),
          backgroundColor: AppColors.kbrandWhite,
          body: BaseBody(
            child: TabBarView(
              controller: _tabController,
              children: [
                PostsView(posts: state.response.data),
                PostsView(posts: state.response.data),
                PostsView(posts: state.response.data),
              ],
            ),
          ),
        );
      } else {
        return Center(child: AppLoadingIndicator());
      }
    });
  }
}
