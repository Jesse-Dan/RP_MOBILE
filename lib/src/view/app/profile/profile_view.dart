import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../base/base_body.dart';
import '../../base/base_scaffold.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile.view';

  const ProfileView({
    super.key,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addAppBar: true,
      physics: const BouncingScrollPhysics(),
      backgroundColor: AppColors.kbrandWhite,
      body: const BaseBody(
        child: Text('data'),
      ),
    );
  }
}
