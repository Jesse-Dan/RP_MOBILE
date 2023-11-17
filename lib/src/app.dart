import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigation_system/navigation_system.dart';
import 'package:recenth_posts/src/logic/bloc/app/countries/country_state.dart';
import 'package:recenth_posts/src/logic/bloc/app/post/index.dart';
import 'package:recenth_posts/src/logic/repository/auth/auth_repo.dart';
import 'package:recenth_posts/src/view/app/posts/post_view.dart';
import 'package:recenth_posts/src/view/auth/reset_password_view/reset_password_view.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/sign_in_view.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/sign_up_view.dart';

import 'logic/bloc/app/countries/country_bloc.dart';
import 'logic/bloc/auth/auth_bloc.dart';
import 'logic/bloc/auth/auth_state.dart';
import 'logic/repository/app/app_repo.dart';
import 'view/auth/forgot_password_fill_email_view/forget_password_view.dart';
import 'view/auth/onboarding_view/onboarding_view.dart';
import 'view/auth/otp_view/otp_view.dart';
import 'view/auth/splash_view/splash_screen_view.dart';

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
                          RegistrationView.routeName: (context, args) =>
                              const RegistrationView(),
                          LoginView.routeName: (context, args) =>
                              const LoginView(),
                          OtpView.routeName: (context, args) => const OtpView(),
                          ForgotPasswordView.routeName: (context, args) =>
                              const ForgotPasswordView(),
                          ResetPasswordView.routeName: (context, args) =>
                              const ResetPasswordView(),
                        },
                      ).generateRoute(routeSettings)),
            ),
          );
        });
  }
}
