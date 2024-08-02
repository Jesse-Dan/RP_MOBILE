import 'package:recenth_posts/src/logic/repository/auth/auth_repo.dart';
import 'package:recenth_posts/src/routes/routes.dart';
import 'package:recenth_posts/src/utils/style/app_theme.dart';
import 'package:recenth_posts/src/view/app/posts/components/comment/bloc/comment_bloc.dart';
import 'package:recenth_posts/src/view/app/posts/components/comment/bloc/comment_state.dart';
import 'package:recenth_posts/src/view/app/posts/components/fav_post/bloc/fav_post_bloc.dart';
import 'package:recenth_posts/src/view/app/posts/components/polls/bloc/poll_bloc.dart';
import 'package:recenth_posts/src/view/app/posts/components/polls/bloc/poll_state.dart';
import 'package:recenth_posts/src/view/app/posts/components/report/bloc/report_bloc.dart';
import 'package:recenth_posts/src/view/app/posts/components/report/bloc/report_state.dart';
import 'package:recenth_posts/src/view/app/posts/components/view/bloc/view_bloc.dart';
import 'package:recenth_posts/src/view/app/posts/components/view/bloc/view_state.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/send_otp_bloc/send_otp_bloc.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/send_otp_bloc/send_otp_state.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/sign_up_bloc/sign_up_bloc_bloc.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/sign_up_bloc/sign_up_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'logic/repository/app/app_repo.dart';
import 'view/app/posts/components/fav_post/bloc/fav_post_state.dart';
import 'view/app/posts/components/post/bloc/index.dart';
import 'view/app/posts/components/star/bloc/like_bloc.dart';
import 'view/app/posts/components/star/bloc/like_state.dart';
import 'view/auth/sign_in_view/bloc/sign_in_bloc/sign_in_bloc_bloc.dart';
import 'view/auth/sign_in_view/bloc/sign_in_bloc/sign_in_bloc_state.dart';
import 'view/auth/sign_up_view/bloc/resend_otp_bloc/resend_otp_bloc.dart';
import 'view/auth/sign_up_view/bloc/resend_otp_bloc/resend_otp_state.dart';
import 'view/auth/sign_up_view/bloc/verify_otp_bloc/verify_otp_bloc_bloc.dart';
import 'view/auth/sign_up_view/bloc/verify_otp_bloc/verify_otp_bloc_state.dart';

class RecenthPosts extends StatefulWidget {
  const RecenthPosts({super.key});

  @override
  State<RecenthPosts> createState() => _RecenthPostsState();
}

class _RecenthPostsState extends State<RecenthPosts> {
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
                /// Sign In Blocs
                BlocProvider(
                  create: (context) =>
                      SignInBlocBloc(const InitialSignInBlocState()),
                ),

                /// Post Blocs
                BlocProvider(
                  create: (context) =>
                      GetPostBlocBloc(const GetPostInitialState()),
                ),

                /// Sign Up Blocs
                /// SIGN UP
                BlocProvider(
                  create: (context) =>
                      SignUpBlocBloc(const InitialSignUpState()),
                ),

                /// RESEND OTP
                BlocProvider(
                  create: (context) =>
                      SignUpResendOtpBloc(const SignUpInitialResendOtpState()),
                ),

                /// SEND OTP
                BlocProvider(
                  create: (context) =>
                      SignUpSendOtpBloc(const SignUpInitialSendOtpState()),
                ),

                /// VERIFY OTP
                BlocProvider(
                  create: (context) =>
                      SignUpVerifyOtpBloc(const SignUpInitialVerifyOtpState()),
                ),

                /// STAR
                BlocProvider(
                  create: (context) => LikeBloc(const InitialLikeState()),
                ),

                /// VOTE ON POLL
                BlocProvider(
                  create: (context) => PollBloc(const InitialPollState()),
                ),

                /// COMMENT ON POLL
                BlocProvider(
                  create: (context) => CommentBloc(const InitialCommentState()),
                ),

                /// MARK POST AS VIEWED
                BlocProvider(
                  create: (context) => ViewBloc(const InitialViewState()),
                ),

                /// REPORT POST
                BlocProvider(
                  create: (context) => ReportBloc(const InitialReportState()),
                ),

                /// FAV POST
                BlocProvider(
                  create: (context) => FavPostBloc(const InitialFavPostState()),
                ),
              ],
              child: InAppNotification(
                child: MaterialApp(
                    theme: AppTheme.lightThemeData(context),
                    darkTheme: AppTheme.darkThemeData(context),
                    themeMode: ThemeMode.dark,
                    onGenerateRoute: (RouteSettings routeSettings) =>
                        AppRoutes.getRoutes(routeSettings)),
              ),
            ),
          );
        });
  }
}
