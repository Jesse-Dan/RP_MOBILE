import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recenth_posts/src/logic/bloc/app/comments/comment_bloc.dart';
import 'package:recenth_posts/src/logic/bloc/app/comments/comment_state.dart';
import 'package:recenth_posts/src/logic/bloc/app/countries/country_state.dart';
import 'package:recenth_posts/src/logic/bloc/app/post/index.dart';
import 'package:recenth_posts/src/logic/bloc/app/reactions/reaction_bloc.dart';
import 'package:recenth_posts/src/logic/bloc/app/reactions/reaction_state.dart';
import 'package:recenth_posts/src/logic/bloc/app/views/view_bloc.dart';
import 'package:recenth_posts/src/logic/bloc/app/views/view_state.dart';
import 'package:recenth_posts/src/logic/repository/auth/auth_repo.dart';
import 'package:recenth_posts/src/routes/routes.dart';
import 'package:recenth_posts/src/utils/style/app_theme.dart';

import 'logic/bloc/app/countries/country_bloc.dart';
import 'logic/bloc/auth/auth_bloc.dart';
import 'logic/bloc/auth/auth_state.dart';
import 'logic/repository/app/app_repo.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider(
                create: (context) => AppRepository(),
              ),
              RepositoryProvider(
                create: (context) => AuthRepository(),
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => PostBloc(const PostInitialState()),
                ),
                BlocProvider(
                  create: (context) => CountryBloc(const CountryInitialState()),
                ),
                BlocProvider(
                  create: (context) => AuthBloc(const AuthInitialState()),
                ),
                BlocProvider(
                  create: (context) => CommentBloc(const CommentInitialState()),
                ),
                BlocProvider(
                  create: (context) =>
                      ReactionBloc(const ReactionInitialState()),
                ),
                BlocProvider(
                  create: (context) => ViewBloc(const ViewInitialState()),
                ),
              ],
              child: MaterialApp(
                  theme: AppTheme.lightThemeData(context),
                  onGenerateRoute: (RouteSettings routeSettings) =>
                      AppRoutes.getRoutes(routeSettings)),
            ),
          );
        });
  }
}
