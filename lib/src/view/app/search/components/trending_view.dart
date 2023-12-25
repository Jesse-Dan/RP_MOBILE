import 'package:flutter/material.dart';

import '../../../../utils/components/action_btn.dart';
import '../../../../utils/components/app_simple_app_bar.dart';
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
      addAppBar: true,
      appBar: AppSimpleAppBar(context, title: 'Trending Now'),
      physics: const BouncingScrollPhysics(),
      backgroundColor: AppColors.kbrandWhite,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        shrinkWrap: true,
        itemCount: 14,
        itemBuilder: (ctx, i) => Container(
          margin: const EdgeInsets.only(bottom: 31 / 2),
          width: 382,
          height: 78,
          child: const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sports',
                      style: TextStyle(
                        color: Color(0xFF6A6A6A),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'LK9812360',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '20k posts',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              SearchTileMoreOptionsDD(imgUrl: 'mingcute_more-2-line.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
