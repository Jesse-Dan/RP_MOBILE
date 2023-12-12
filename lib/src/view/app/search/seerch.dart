// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../base/base_scaffold.dart';

class SearchView extends StatefulWidget {
  static const String routeName = '/search.view';

  const SearchView({
    super.key,
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
