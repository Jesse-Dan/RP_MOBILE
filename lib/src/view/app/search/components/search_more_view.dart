// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';

import '../../../../utils/components/action_btn.dart';
import '../../../../utils/components/app_text_field.dart';
import '../../../../utils/style/app_colors.dart';
import '../../../../utils/style/app_dimentions.dart';
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
  List<SearchModel> searchList = [];

  //  AppTextField
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: true,
      addSafeArea: false,
      addAppBar: true,
      appbar: AppBar(
        leading: IconButton(
            onPressed: () {
              Go(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.kgrayColor400,
            )),
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        foregroundColor: AppColors.kbrandWhite,
        centerTitle: true,
        title: TextFormField(
          controller: searchCtl,
          style: myTextFieldStyle(context),
          onChanged: (val) {
            searchList.clear();
            search(val);
          },
          onSaved: (val) {
            searchList.clear();
          },
          onFieldSubmitted: (val) {
            searchList.clear();
          },
          onTapOutside: (onTapOutside) {
            searchList.clear();
          },
          decoration: InputDecoration(
            labelStyle: myTextFieldHintStyle(context),
            hintText: 'Search',
            helperStyle: myTextFieldHintStyle(context),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                  top: AppDimentions.k16, bottom: AppDimentions.k16, left: 10),
              child: SvgPicture.asset('assets/icons/search-normal.svg',
                  color: AppColors.kgrayColor400, height: 20, width: 20),
            ),
            contentPadding: const EdgeInsets.all(AppDimentions.k20 + 3),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.kgrayColor200),
                borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.kgrayColor200),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.kgrayColor200),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ActionBtn(
              imgUrl: 'bi_filter.svg',
              onPressed: () {},
            ),
          ),
        ],
      ),
      safeAreaConfig: const SafeAreaConfig(bottom: false),
      physics: const BouncingScrollPhysics(),
      backgroundColor: AppColors.kbrandWhite,
      body: searchList.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              shrinkWrap: true,
              itemCount: searchList.length,
              itemBuilder: (ctx, i) => ListTile(
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: searchList[i].group,
                            style: const TextStyle(
                              color: Color(0xFF232323),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' ${searchList[i].title}',
                            style: const TextStyle(
                              color: Color(0xFF6A6A6A),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              shrinkWrap: true,
              itemCount: 20,
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

  void search(String val) {
    setState(() {
      searchList.addAll(data
          .where((element) => element.toLowerCase().contains(val.toLowerCase()))
          .toList()
          .map((e) => SearchModel(group: val, title: e))
          .toList());
    });
  }

  final data = [
    'Technology',
    'Throwback',
    'Thursday',
    'Values',
    'Work',
    'Wellness',
    'Weekend',
    'Wisdom',
    'Adventure',
    'Art',
    'Books',
    'Beauty',
    'Creativity',
    'Culture',
    'Education',
    'Fashion',
    'Fitness',
    'Food',
    'Friends',
    'Health',
    'Happiness',
    'Inspiration',
    'Music',
    'Nature',
    'Photography',
    'Poetry',
    'Relationships',
    'Self-care',
    'Spirituality',
    'Travel',
    'Writing',
    'Motivation',
    'Mindfulness',
    'Growth',
    'Kindness',
    'Learning',
    'Mindset',
    'Success',
    'Goals',
    'Gratitude',
    'Positivity',
    'Challenges',
    'Reflection'
  ];
}

class SearchModel {
  final String group;
  final String title;

  SearchModel({required this.group, required this.title});
}
