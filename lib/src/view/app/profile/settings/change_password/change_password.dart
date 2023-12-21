// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../../../../utils/components/app_simple_app_bar.dart';
import '../../../../base/base_scaffold.dart';

class ChangePasswordView extends StatefulWidget {
  static const String routeName = '/profile.view.settings.change.password';

  const ChangePasswordView({
    super.key,
  });

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) => BaseScaffold(
        addAppBar: true,
        addSafeArea: true,
        addbodyPadding: true,
        appbar: AppSimpleAppBar(context, title: 'Change Password'),
        physics: const BouncingScrollPhysics(),
        backgroundColor: AppColors.kbrandWhite,
        // body: ,
      );
}
