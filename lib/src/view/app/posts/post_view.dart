import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/logic/bloc/app/post/index.dart';
import 'package:recenth_posts/src/logic/repository/app/post_repo.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/error_handler.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/loading_handler.dart';

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
    // context
    //     .read<PostBloc>()
    //     .add(GetAllPostEvent(context.read<PostRepository>()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
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
            // SuccessHandler(context: context);
          }
        },
        builder: (context, state) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: 32,
            itemBuilder: (_, i) => const ListTile(
              title: Text('This is the way'),
            ),
            separatorBuilder: (_, i) => const Divider(),
          );
        },
      ),
    );
  }
}
