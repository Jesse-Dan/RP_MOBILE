// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:recenth_posts/src/view/app/search/components/search_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/components/app_text_field.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/view/app/search/components/search_more_view.dart';
import 'package:recenth_posts/src/view/app/search/components/trending_view.dart';
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
  final TextEditingController searchCtl = TextEditingController();
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: true,
      physics: const NeverScrollableScrollPhysics(),
      backgroundColor: AppColors.kbrandWhite,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            AppTextField(
              readOnly: true,
              controller: searchCtl,
              prefix: SvgPicture.asset('assets/icons/search-normal.svg',
                  color: AppColors.kgrayColor400, height: 20, width: 20),
              hintText: 'Search',
              onTap: () {
                Go(context, routeName: SearchMoreView.routeName).to();
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Trending Now',
              style: TextStyle(
                color: Color(0xFF232323),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 382,
              height: 512,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: scrollController,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (ctx, i) => Container(
                  margin: EdgeInsets.only(bottom: 31 / 2),
                  width: 382,
                  height: 78,
                  child: Row(
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
                                color: AppColors.kprimaryColor800,
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
                      SearchMoreDropDown(
                        imgUrl: 'mingcute_more-2-line.svg',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Go(context, routeName: TrendingView.routeName).to();
              },
              child: Text(
                'See more',
                style: TextStyle(
                  color: AppColors.kprimaryColor700,
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
