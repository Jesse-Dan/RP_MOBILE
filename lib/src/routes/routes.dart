import 'package:flutter/material.dart';
import 'package:navigation_system/navigation_system.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/app/posts/components/comment_on_post.dart';
import 'package:recenth_posts/src/view/app/posts/components/post_details.dart';
import 'package:recenth_posts/src/view/app/posts/components/report/report.dart';
import 'package:recenth_posts/src/view/app/posts/post_view.dart';
import 'package:recenth_posts/src/view/app/profile/settings/subscriptions/subscriptions.dart';
import 'package:recenth_posts/src/view/auth/onboarding_view/login_mode.dart';
import 'package:recenth_posts/src/view/auth/reset_password_view/reset_password_view.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/sign_in_view.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/sign_up_view.dart';

import '../view/app/profile/settings/settings_view.dart';
import '../view/auth/forgot_password_fill_email_view/forget_password_view.dart';
import '../view/auth/onboarding_view/onboarding_view.dart';
import '../view/auth/otp_view/otp_view.dart';
import '../view/auth/splash_view/splash_screen_view.dart';
import '../view/base/base_app.dart';

class AppRoutes {
  static getRoutes(RouteSettings routeSettings) => NavigationSystem(
        initialRoute: const SplashScreenView(),
        routes: {
          SplashScreenView.routeName: (context, args) =>
              const SplashScreenView(),
          OnboardingView.routeName: (context, args) => const OnboardingView(),
          PostView.routeName: (context, args) => const PostView(),
          RegistrationView.routeName: (context, args) =>
              const RegistrationView(),
          LoginView.routeName: (context, args) => const LoginView(),
          OtpView.routeName: (context, args) => const OtpView(),
          ForgotPasswordView.routeName: (context, args) =>
              const ForgotPasswordView(),
          ResetPasswordView.routeName: (context, args) =>
              const ResetPasswordView(),
          LoginModeView.routeName: (context, args) => LoginModeView(),
          BaseApp.routeName: (context, args) => BaseApp(
              currentIndex: args?.arguments[0]['currentIndex'] ?? 0,
              newPost: args?.arguments[0]['newPost']),
          ReplyPost.routeName: (context, arg) => ReplyPost(
                post: arg?.arguments[0]['post'],
                commentType:
                    arg?.arguments[0]['commentType'] ?? CommentType.Comment,
              ),
          PostDetailsWidget.routeName: (context, arg) => PostDetailsWidget(
              postCardType: arg?.arguments[0]['postCardType'],
              post: arg?.arguments[0]['post']),
          Report.routeName: (context, args) => Report(),
          SettingsView.routeName: (context, args) => const SettingsView(),
          SubscritionsView.routeName: (context, args) =>
              const SubscritionsView()
        },
      ).generateRoute(routeSettings);
}
