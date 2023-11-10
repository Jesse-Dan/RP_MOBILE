import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/navigation_system.dart';
import 'package:recenth_posts/src/logic/bloc/app/post/index.dart';
import 'package:recenth_posts/src/logic/repository/app/post_repo.dart';
import 'package:recenth_posts/src/view/app/posts/post_view.dart';
import 'view/auth/onboarding_view/onboarding_view.dart';
import 'view/auth/splash_view/splash_screen_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
                create: (context) => PostRepository(),
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => PostBloc(PostInitialState()),
                ),
              ],
              child: MaterialApp(
                  onGenerateRoute: (RouteSettings routeSettings) =>
                      NavigationSystem(
                        initialRoute: const SplashScreenView(),
                        routes: {
                          SplashScreenView.routeName: (context, args) =>
                              const SplashScreenView(),
                          OnboardingView.routeName: (context, args) =>
                              const OnboardingView(),
                          PostView.routeName: (context, args) =>
                              const PostView(),
                        },
                      ).generateRoute(routeSettings)),
            ),
          );
        });
  }
}
