import 'package:flutter/material.dart';
import '../../../../utils/style/app_colors.dart';
import '../../../base/base_scaffold.dart';

class SearchMoreView extends StatefulWidget {
  static const String routeName = '/search.more.view';

  const SearchMoreView({
    super.key,
  });

  @override
  State<SearchMoreView> createState() => _SearchMoreViewState();
}

class _SearchMoreViewState extends State<SearchMoreView> {
  final TextEditingController searchCtl = TextEditingController();
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: true,
      physics: const NeverScrollableScrollPhysics(),
      backgroundColor: AppColors.kbrandWhite,
    );
  }
}
