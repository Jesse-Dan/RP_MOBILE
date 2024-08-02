import 'package:recenth_posts/src/logic/services/location_service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go_builder.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/app/chat/chats_view.dart';
import 'package:recenth_posts/src/view/app/notification/nootification_view.dart';
import 'package:recenth_posts/src/view/app/profile/settings/change_password/change_password.dart';
import 'package:recenth_posts/src/view/app/profile/settings/privacy/bloocked_users.dart';
import 'package:recenth_posts/src/view/app/profile/settings/privacy/privacy_view.dart';
import 'package:recenth_posts/src/view/app/profile/settings/privacy/reported_users.dart';
import 'package:recenth_posts/src/view/app/profile/settings/profile/profile_view.dart';
import 'package:recenth_posts/src/view/app/profile/settings/security/security_view.dart';
import 'package:recenth_posts/src/view/app/profile/settings/subscriptions/all_subs/all_subs_view.dart';
import 'package:recenth_posts/src/view/app/profile/settings/subscriptions/subscriptions.dart';
import 'package:recenth_posts/src/view/app/search/components/search_more_view.dart';
import 'package:recenth_posts/src/view/app/search/search.dart';
import 'package:recenth_posts/src/view/auth/onboarding_view/login_mode.dart';
import 'package:recenth_posts/src/view/auth/reset_password_view/reset_password_view.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/sign_in_view.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/sign_up_view.dart';

import '../utils/components/web_view.dart';
import '../view/app/chat/components/chat_details.dart';
import '../view/app/posts/components/comment/components/comment_on_post.dart';
import '../view/app/posts/components/create_post/create_post.dart';
import '../view/app/posts/components/post/components/post_details/post_details.dart';
import '../view/app/posts/components/report/report_view.dart';
import '../view/app/posts/post.dart';
import '../view/app/profile/settings/privacy/visibility.dart';
import '../view/app/profile/settings/settings_view.dart';
import '../view/app/search/components/trending_view.dart';
import '../view/auth/forgot_password_fill_email_view/forget_password_view.dart';
import '../view/auth/onboarding_view/onboarding_view.dart';
import '../view/auth/otp_view/otp_view.dart';
import '../view/auth/splash_view/splash_screen_view.dart';
import '../view/base/base_app.dart';

class AppRoutes {
  static getRoutes(RouteSettings routeSettings) {
    return NavigationRouteBuilder(
      initialRoute: const SplashScreenView(),
      routes: {
        SplashScreenView.routeName: (context, args) => const SplashScreenView(),
        OnboardingView.routeName: (context, args) => const OnboardingView(),
        PostView.routeName: (context, args) => const PostView(),
        RegistrationView.routeName: (context, args) => const RegistrationView(),
        LoginView.routeName: (context, args) => const LoginView(),
        OtpView.routeName: (context, args) =>
            OtpView(email: args?.arguments[0]['email']),
        ForgotPasswordView.routeName: (context, args) =>
            const ForgotPasswordView(),
        ResetPasswordView.routeName: (context, args) =>
            const ResetPasswordView(),
        LoginModeView.routeName: (context, args) => LoginModeView(),
        BaseApp.routeName: (context, args) => BaseApp(
            currentIndex: args?.arguments[0]['currentIndex'] ??
                LocalStorageService.getInt('currentIndex'),
            newPost: args?.arguments[0]['newPost']),
        ReplyPost.routeName: (context, arg) => ReplyPost(
            post: arg?.arguments[0]['post'],
            commentType:
                arg?.arguments[0]['commentType'] ?? CommentType.Comment),
        PostDetailsWidget.routeName: (context, arg) => PostDetailsWidget(
            // postCardType: arg?.arguments[0]['postCardType'],
            // comment:  arg?.arguments[0]['comment'],
            post: arg?.arguments[0]['post']),
        Report.routeName: (context, args) => Report(
              post: args?.arguments[0]['post'],
            ),
        SettingsView.routeName: (context, args) => const SettingsView(),

        ChatsView.routeName: (context, args) => const ChatsView(),
        NotificationView.routeName: (context, args) => const NotificationView(),
        SearchView.routeName: (context, args) => const SearchView(),
        SearchMoreView.routeName: (context, args) => SearchMoreView(
              post: args?.arguments[0]['post'],
            ),
        TrendingView.routeName: (context, args) => const TrendingView(),
        // ChatsUseriew.routeName: (context, args) => const ChatsUseriew(),
        ChatDetailsView.routeName: (context, args) => ChatDetailsView(
              chatsData: args?.arguments[0]['chat'] as List<Chat>,
              reciever: args?.arguments[0]['reciever'],
            ),
        ChangePasswordView.routeName: (context, args) =>
            const ChangePasswordView(),
        ProfileDetailView.routeName: (context, args) =>
            const ProfileDetailView(),
        PrivacyView.routeName: (context, args) => const PrivacyView(),
        SecurityView.routeName: (context, args) => const SecurityView(),
        SubscritionsView.routeName: (context, args) => const SubscritionsView(),
        PrivacyVisibilityView.routeName: (context, args) =>
            const PrivacyVisibilityView(),
        BlockedUsersView.routeName: (context, args) => const BlockedUsersView(),
        ReportedUsersView.routeName: (context, args) =>
            const ReportedUsersView(),
        AllSubsView.routeName: (context, args) => const AllSubsView(),
        AppWebView.routeName: (context, args) => AppWebView(
              url: args?.arguments[0]['url'],
            ),
        CreatePost.routeName: (context, args) => CreatePost(
              postType: args?.arguments[0]['postType'],
            )
      },
    ).generateRoute(routeSettings);
  }
}
