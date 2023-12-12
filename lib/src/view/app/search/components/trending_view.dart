import 'package:flutter/material.dart';

import '../../../../utils/style/app_colors.dart';
import '../../../base/base_scaffold.dart';

class TrendingView extends StatefulWidget {
  static const String routeName = '/trending.view';

  const TrendingView({
    super.key,
  });

  @override
  State<TrendingView> createState() => _TrendingViewState();
}

class _TrendingViewState extends State<TrendingView> {
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
