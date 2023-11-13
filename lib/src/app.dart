import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/navigation_system.dart';
import 'package:recenth_posts/src/logic/bloc/app/post/index.dart';
import 'package:recenth_posts/src/logic/bloc/auth/login/login_bloc.dart';
import 'package:recenth_posts/src/logic/bloc/auth/login/login_state.dart';
import 'package:recenth_posts/src/logic/bloc/auth/reg/reg_bloc.dart';
import 'package:recenth_posts/src/logic/bloc/auth/reg/reg_state.dart';
import 'package:recenth_posts/src/logic/repository/app/post_repo.dart';
import 'package:recenth_posts/src/logic/repository/auth/auth_repo.dart';
import 'package:recenth_posts/src/view/app/posts/post_view.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/sign_in_view.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/sign_up_view.dart';
import 'view/auth/onboarding_view/onboarding_view.dart';
import 'view/auth/splash_view/splash_screen_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                create: (context) => PostRepository(),
              ),
               RepositoryProvider(
                create: (context) => AuthRepository(),
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => PostBloc(PostInitialState()),
                ),
                 BlocProvider(
                  create: (context) => LoginBloc(LoginInitialState()),
                ), BlocProvider(
                  create: (context) => RegistrationBloc(RegistrationInitialState()),
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
                          RegisterScreen.routeName: (context, args) =>
                              RegisterScreen(),
                          LoginScreen.routeName: (context, args) =>
                              LoginScreen(),
                        },
                      ).generateRoute(routeSettings)),
            ),
          );
        });
  }
}
