// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../../../../utils/components/app_simple_app_bar.dart';
import '../../../../base/base_scaffold.dart';

class SecurityView extends StatefulWidget {
  static const String routeName = '/profile.view.settings.security';

  const SecurityView({
    super.key,
  });

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) => BaseScaffold(
        addAppBar: true,
        addSafeArea: true,
        addbodyPadding: true,
        appbar: AppSimpleAppBar(context, title: 'Security'),
        physics: const BouncingScrollPhysics(),
        backgroundColor: AppColors.kbrandWhite,
        // body: ,
      );
}
