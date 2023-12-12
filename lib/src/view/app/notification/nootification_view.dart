// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../base/base_scaffold.dart';

class NotificationView extends StatefulWidget {
  static const String routeName = '/notification.view';

  const NotificationView({
    super.key,
  });

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: true,
      physics: const BouncingScrollPhysics(),
      backgroundColor: AppColors.kbrandWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }
}
