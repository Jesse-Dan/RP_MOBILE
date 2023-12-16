// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/components/action_btn.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:recenth_posts/src/view/app/chat/components/chat_details.dart';
import 'package:recenth_posts/src/view/base/base_body.dart';

import '../../../utils/components/app_divider.dart';
import '../../../utils/components/profile_icon.dart';
import '../../base/base_scaffold.dart';

class ChatsView extends StatefulWidget {
  static const String routeName = '/chats.view';

  const ChatsView({
    super.key,
  });

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  final scrollCtl = ScrollController();
  final btmSheetScrollCtl = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseScaffold(
          addbodyPadding: false,
          addAppBar: true,
          physics: const BouncingScrollPhysics(),
          backgroundColor: AppColors.kbrandWhite,
          appbar: AppBar(
            backgroundColor: AppColors.kbrandWhite,
            foregroundColor: AppColors.kbrandWhite,
            title: Text(
              'Chats',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0B0B0B),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ActionBtn(imgUrl: 'linear_search-normal.svg'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ActionBtn(imgUrl: 'mingcute_more-2-line.svg'),
              )
            ],
            bottom: ActiveUsers(),
            toolbarHeight: 180,
          ),
          body: BaseBody(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDivider.build(),
                  const SizedBox(height: 20),
                  RefreshIndicator.adaptive(
                    onRefresh: () async {},
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollCtl,
                      itemCount: 20,
                      shrinkWrap: true,
                      itemBuilder: (ctx, i) {
                        return ChatListTile();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 100,
            right: 16,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: AppColors.kprimaryColor700,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              onPressed: () {
                showModalBottomSheet(
                  elevation: 5,
                  enableDrag: true,
                  backgroundColor: AppColors.kbrandWhite,
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      width: 430,
                      height: 914,
                      child: Stack(
                        children: [
                          Container(
                            color: AppColors.kbrandWhite,
                            margin: const EdgeInsets.only(top: 90.0),
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppDimentions.k12,
                              ),
                              shrinkWrap: true,
                              itemCount: 30,
                              controller: btmSheetScrollCtl,
                              itemBuilder: (ctx, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppDimentions.k12),
                                  child: ListTile(
                                    tileColor: AppColors.kbrandWhite,
                                    leading: ProfileIcon(
                                        height: 56,
                                        width: 56,
                                        margin: EdgeInsets.only(left: 0)),
                                    title: Text(
                                      'Bessie Cooper',
                                      style: TextStyle(
                                        color: Color(0xFF0B0B0B),
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0.10,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '@BC9128469',
                                      style: TextStyle(
                                        color: Color(0xFF8D8D8D),
                                        fontSize: 14,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0.10,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return AppDivider.build();
                              },
                            ),
                          ),
                          Container(
                            height: 90,
                            padding: const EdgeInsets.only(
                                top: 14.0, left: 14, right: 14),
                            decoration: BoxDecoration(
                                color: AppColors.kbrandWhite,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            child: Column(children: [
                              Text(
                                'Add New Chat',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0B0B0B),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Favourite List',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Color(0xFF464646),
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0.10,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          Positioned(
                              top: 16,
                              right: 16,
                              child: ActionBtn(
                                  onPressed: () {
                                    Go(context).pop();
                                  },
                                  imgUrl: 'iconamoon_close-fill.svg')),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Center(
                child: Icon(
                  Icons.add_rounded,
                  color: AppColors.kbrandWhite,
                ),
              ),
            ))
      ],
    );
  }
}

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        onTap: () {
          Go(context, routeName: AddChatFromFavView.routeName).to();
        },
        leading: ProfileIcon(height: 56, width: 56, margin: EdgeInsets.all(0)),
        title: Text(
          'Maria  Amber',
          style: TextStyle(
            color: Color(0xFF0B0B0B),
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          'Your post was see by me yeste...',
          style: TextStyle(
            color: Color(0xFF8D8D8D),
            fontSize: 14,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Column(
          children: [
            Text(
              '11:30',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF8D8D8D),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                color: Color(0xFFD75B6B),
                shape: OvalBorder(),
              ),
              child: Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActiveUsers extends StatelessWidget implements PreferredSizeWidget {
  const ActiveUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Now Active',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF232323),
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Text(
                'See All',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD75B6B),
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          SizedBox(
            height: 90,
            child: ListView.builder(
                itemCount: 9,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      Go(context, routeName: AddChatFromFavView.routeName).to();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProfileIcon(
                              height: 56, width: 56, margin: EdgeInsets.all(0)),
                          const SizedBox(height: 10),
                          Text(
                            'Monica',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF8D8D8D),
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 26),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
