// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:recenth_posts/src/logic/models/app/user_model.dart';
import 'package:recenth_posts/src/utils/components/action_btn.dart';
import 'package:recenth_posts/src/utils/components/app_divider.dart';
import 'package:recenth_posts/src/utils/components/profile_icon.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:recenth_posts/src/view/app/profile/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../base/base_scaffold.dart';
import '../posts/components/post/bloc/get_post_bloc_bloc.dart';
import '../posts/components/post/bloc/get_post_bloc_state.dart';
import '../posts/components/post/post_widget.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile.view';

  const ProfileView({
    super.key,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var user = User.getPresentUser();

  _ProfileViewState() {
    if (!verified || verified) {
      Timer(const Duration(seconds: 4), () {
        setState(() {
          verified = false;
        });
      });
    }
  }

  bool verified = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        addAppBar: verified,
        addSafeArea: !verified,
        addbodyPadding: true,
        physics: const BouncingScrollPhysics(),
        backgroundColor: AppColors.kbrandWhite,
        appBar: ProfileAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerifiedStatusBar(
                verified: !verified,
                onCancelled: () {
                  setState(() {
                    verified = !verified;
                  });
                },
              ),
              (!verified) ? ProfileAppBar() : const SizedBox.shrink(),
              const SizedBox(height: 24),
              ProfileHead(user: user),
              const SizedBox(height: 24),
              const Text(
                'Passionate about technology, enjoys sharing insights about the digital world.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 24),
              // const CountAndRating(),
              BlocBuilder<GetPostBlocBloc, GetPostBlocState>(
                builder: (context, state) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (item, i) {
                        return PostWidget(
                          post: (state is GetPostSucessfulState)
                              ? state.response.data![i]
                              : null,
                          i: i,
                        );
                      });
                },
              ),
            ],
          ),
        ));
  }

  AppBar ProfileAppBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      leadingWidth: 150,
      leading: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Profile',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xFF0B0B0B),
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      actions: [
        // Padding(
        //   padding: const EdgeInsets.only(right: 16.0),
        //   child: ActionBtn(
        //     addbadge: true,
        //     imgUrl: 'notification-bing.svg',
        //     onPressed: () {},
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ActionBtn(
            imgUrl: 'setting-2.svg',
            onPressed: () {
              Go(context, routeName: SettingsView.routeName).to();
            },
          ),
        ),
      ],
    );
  }
}

class CountAndRating extends StatelessWidget {
  const CountAndRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppDivider.build(),
      const SizedBox(height: 48),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const CountBuild(
          title: 'Views',
          count: 126,
        ),
        VerticalDivider(
          color: AppColors.kgrayColor100,
          width: 2,
        ),
        const CountBuild(
          title: 'Comments',
          count: 126,
        ),
        VerticalDivider(
          color: AppColors.kgrayColor100,
          width: 2,
        ),
        const CountBuild(
          title: 'Posts',
          count: 126,
        ),
      ]),
      const SizedBox(height: 24),
      AppDivider.build(),
      const SizedBox(height: 40),
      const Rating(
        stageId: 0.3,
        stat: '5',
      ),
      const Rating(
        stageId: 0.4,
        stat: '4',
      ),
      const Rating(
        stageId: 0.7,
        stat: '3',
      ),
      const Rating(
        stageId: 0.007,
        stat: '2',
      ),
      const Rating(
        stageId: 0.9,
        stat: '1',
      ),
      const SizedBox(height: 24),
      AppDivider.build(),
      const SizedBox(height: 24),
    ]);
  }
}

class Rating extends StatelessWidget {
  final double stageId;
  final String stat;

  const Rating({
    super.key,
    required this.stageId,
    required this.stat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 24,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$stat star',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFD75B6B),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: LinearPercentIndicator(
                barRadius: const Radius.circular(7),
                lineHeight: 14.0,
                percent: stageId,
                progressColor: AppColors.kwarningColor400,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '${(stageId * 100).round()}%',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF232323),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class CountBuild extends StatelessWidget {
  final String title;
  final double count;
  const CountBuild({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          count.round().toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class ProfileHead extends StatelessWidget {
  final User user;
  const ProfileHead({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileIcon(
          margin: EdgeInsets.all(0),
          height: 60,
          width: 60,
        ),
        SizedBox(width: 24),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name ?? '${user.firstName} ${user.lastName}',
              style: TextStyle(
                color: Color(0xFF0B0B0B),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            Opacity(
              opacity: 0.80,
              child: Text(
                user.id.toString(),
                style: TextStyle(
                  color: Color(0xFF464646),
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class VerifiedStatusBar extends StatelessWidget {
  final bool verified;
  final VoidCallback onCancelled;
  const VerifiedStatusBar({
    super.key,
    required this.verified,
    required this.onCancelled,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: verified,
      child: Stack(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.all(AppDim.k12),
            decoration: ShapeDecoration(
              color: AppColors.kprimaryColor700,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 4.08,
                  percent: 0.4,
                  center: const Text("${0.3 * 100}%"),
                  progressColor: AppColors.kbrandWhite,
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Verify your account',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 244,
                        child: Text(
                          'Verify your account to experience the best posting experience.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 3,
            right: 3,
            child: IconButton(
                color: AppColors.kbrandWhite,
                onPressed: onCancelled,
                icon: const Icon(Icons.clear_rounded)),
          ),
        ],
      ),
    );
  }
}
