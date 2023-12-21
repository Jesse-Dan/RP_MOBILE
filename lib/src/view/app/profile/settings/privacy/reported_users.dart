// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../../../../utils/components/app_simple_app_bar.dart';
import '../../../../../utils/components/profile_icon.dart';
import '../../../../../utils/style/app_dimentions.dart';
import '../../../../base/base_scaffold.dart';

class ReportedUsersView extends StatefulWidget {
  static const String routeName =
      '/profile.view.settings.privacy.reported.users';

  const ReportedUsersView({
    super.key,
  });

  @override
  State<ReportedUsersView> createState() => _ReportedUsersViewState();
}

class _ReportedUsersViewState extends State<ReportedUsersView> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) => BaseScaffold(
        addAppBar: true,
        addSafeArea: false,
        addbodyPadding: true,
        appbar: AppSimpleAppBar(context, title: 'Reported Users (24)'),
        physics: const BouncingScrollPhysics(),
        backgroundColor: AppColors.kbrandWhite,
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, i) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: AppDimentions.k16 / 2),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(AppDimentions.k12),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Color(0xFFEFEFEF),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: const ProfileIcon(
                    height: 56,
                    width: 56,
                    margin: EdgeInsets.all(0),
                  ),
                  title: const Text(
                    'Kristin Watson',
                    style: TextStyle(
                      color: Color(0xFF0B0B0B),
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      height: 0.10,
                    ),
                  ),
                  subtitle: const Text(
                    '@EH9128469',
                    style: TextStyle(
                      color: Color(0xFF8D8D8D),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                    ),
                  ),
                ),
              );
            }),
      );
}
