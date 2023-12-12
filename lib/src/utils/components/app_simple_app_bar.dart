// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';

import '../style/app_colors.dart';

AppBar AppSimpleAppBar(BuildContext context, {title}) {
  return AppBar(
    toolbarHeight: 80,
    leading: IconButton(
        onPressed: () {
          Go(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
    backgroundColor: AppColors.kbrandWhite,
    title: Text(title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),),
    centerTitle: true,
  );
}
