import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/logic/bloc/app/comments/comment_bloc.dart';
import 'package:recenth_posts/src/logic/bloc/app/post/index.dart';
import 'package:recenth_posts/src/logic/bloc/app/reactions/reaction_bloc.dart';
import 'package:recenth_posts/src/logic/bloc/app/views/view_bloc.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/error_handler.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/loading_handler.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/logic/services/storage_service/local_storage_service.dart';
import 'package:recenth_posts/src/utils/constants/global_constants.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../../logic/bloc/app/comments/comment_event.dart';
import '../../../logic/bloc/app/reactions/reaction_event.dart';
import '../../../logic/bloc/app/views/view_event.dart';
import '../../../logic/models/app/post/payload/comment_payload.dart';
import '../../../logic/models/app/post/payload/react_payload.dart';
import '../../../logic/models/app/post/payload/view_payload.dart';
import '../../../logic/models/app/post/res/get_all_post_response.dart';
import '../../../logic/repository/app/app_repo.dart';
import '../../../utils/style/app_dimentions.dart';
import '../../base/base_scaffold.dart';

class PostView extends StatefulWidget {
  static const String routeName = '/post.view';

  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    context
        .read<PostBloc>()
        .add(GetAllPostEvent(context.read<AppRepository>()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      refreshable: true,
      onRefresh: () async {
        Logger(
            tag: Tag.CALLBACK,
            message: LocalStgService().getData(GlobalConstants.BEARER_TOKEN));
        context
            .read<PostBloc>()
            .add(GetAllPostEvent(context.read<AppRepository>()));
      },
      floatingActionButton: FloatingActionButton(onPressed: () {
        Logger(
            tag: Tag.CALLBACK,
            message: LocalStgService().getData(GlobalConstants.BEARER_TOKEN));
        context
            .read<PostBloc>()
            .add(GetAllPostEvent(context.read<AppRepository>()));
      }),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostErrorState) {
            Go(context).pop();
            ErrorHandler(context: context, message: state.errorMessage);
          }
          if (state is PostLoadingState) {
            LoadingHandler(context: context);
          }
          if (state is PostLoadedState) {
            Go(context).pop();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 900,
                child: (state is PostLoadedState)
                    ? ListView.separated(
                        // shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.postResponse.length,
                        itemBuilder: (_, i) {
                          return PostWidget(post: state.postResponse[i]);
                        },
                        separatorBuilder: (_, i) => const Divider(),
                      )
                    : ListView.separated(
                        // shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 32,
                        itemBuilder: (_, i) => const ListTile(
                          title: Text('This is the way'),
                        ),
                        separatorBuilder: (_, i) => const Divider(),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimentions.k16),
      margin: const EdgeInsets.symmetric(vertical: AppDimentions.k20),
      decoration: BoxDecoration(color: AppColors.kwineColor.withOpacity(0.07)),
      child: ListTile(
        title: Text(
          post.subject!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.content!),
            const SizedBox(height: 8.0),
            Text(
              'By: ${post.user!.firstName!} ${post.user!.lastName!}',
            ),
            const SizedBox(height: 8.0),
            Text('Category: ${post.category!.name!}'),
            const SizedBox(height: 8.0),
            // Display comments count or other information as needed
            const Text('Comments: 0'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      context.read<ReactionBloc>().add(ReactToPostsEvent(
                          context.read<AppRepository>(),
                          ReactPayload(
                              reactId: 2,
                              refType: 2,
                              parentCommentId: 22,
                              postId: null,
                              userId: 2)));
                    },
                    icon: const Icon(Icons.favorite)),
                IconButton(
                    onPressed: () {
                      context.read<CommentBloc>().add(CommentOnPostEvent(
                          context.read<AppRepository>(),
                          CommentPayload(
                              comment: 'Testing from app',
                              refType: 2,
                              parentCommentId: 22,
                              postId: null,
                              userId: 2)));
                    },
                    icon: const Icon(Icons.chat)),
                IconButton(
                    onPressed: () {
                      context.read<ViewBloc>().add(ViewPostEvent(
                          context.read<AppRepository>(),
                          ViewPayload(userId: 2, refId: 1)));
                    },
                    icon: const Icon(Icons.share))
              ],
            )
          ],
        ),
        // Implement onTap to navigate to a detailed post view
        onTap: () {
          // Implement navigation logic to detailed view
          if (kDebugMode) {
            print('Tapped on post: ${post.id}');
          }
        },
      ),
    );
  }
}
