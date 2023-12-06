import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/view/app/posts/post_view.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

import '../../utils/components/app_nav_bar_icoons.dart';

class BaseApp extends StatefulWidget {
  static const String routeName = 'app.app';
  const BaseApp({super.key});

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  List<Widget> screens = [
    const PostView(),
    const Center(child: Text('search')),
    const Center(child: Text('chats')),
    const Center(child: Text('profile')),
  ];

  int currentIndex = 0;

  tabMove(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        physics: const NeverScrollableScrollPhysics(),
        bottomNavigationBar: Container(
          height: 88,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.kbrandWhite,
              border: Border.symmetric(
                  horizontal: BorderSide(color: AppColors.kgrayColor200))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppNavBarIcon(
                  img: 'home_tab.png',
                  selectedImg: 'sel_home_tab.png',
                  currentIndex: currentIndex,
                  value: 0,
                  onTap: () {
                    tabMove(0);
                  }),
              AppNavBarIcon(
                  img: 'search_tab.png',
                  selectedImg: 'sel_search_tab.png',
                  currentIndex: currentIndex,
                  value: 1,
                  onTap: () {
                    tabMove(1);
                  }),
              AppNavBarIcon(
                  img: 'chats_tab.png',
                  selectedImg: 'sel_chats_tab.png',
                  currentIndex: currentIndex,
                  value: 2,
                  onTap: () {
                    tabMove(2);
                  }),
              AppNavBarIcon(
                  img: 'profile_tab.png',
                  selectedImg: 'sel_profile_tab.png',
                  currentIndex: currentIndex,
                  value: 3,
                  onTap: () {
                    tabMove(3);
                  }),
            ],
          ),
        ),
        backgroundColor: AppColors.kbrandWhite,
        addbodyPadding: false,
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: screens[currentIndex]));
  }
}
