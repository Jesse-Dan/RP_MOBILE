// ignore_for_file: deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/view/app/profile/settings/privacy/bloocked_users.dart';
import 'package:recenth_posts/src/view/app/profile/settings/privacy/reported_users.dart';
import 'package:recenth_posts/src/view/app/profile/settings/privacy/visibility.dart';

import '../../../../../utils/components/app_divider.dart';
import '../../../../../utils/components/app_simple_app_bar.dart';
import '../../../../../utils/style/app_dimentions.dart';
import '../../../../base/base_scaffold.dart';

class PrivacyView extends StatefulWidget {
  static const String routeName = '/profile.view.settings.privacy';

  const PrivacyView({
    super.key,
  });

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  ScrollController scrollController = ScrollController();

  bool privacyModeVal = false;
  @override
  Widget build(BuildContext context) => BaseScaffold(
        addAppBar: true,
        addSafeArea: false,
        addbodyPadding: true,
        appbar: AppSimpleAppBar(context, title: 'Privacy'),
        physics: const BouncingScrollPhysics(),
        backgroundColor: AppColors.kbrandWhite,
        body: Column(
          children: [
            Container(
                color: AppColors.kbrandWhite,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: AppDimentions.k16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Privacy & Visibilty',
                      style: TextStyle(
                        color: Color(0xFF8D8D8D),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: AppDimentions.k16),
                    Expanded(child: AppDivider.build(height: 1.5))
                  ],
                )),
            ListView.builder(
                shrinkWrap: true,
                itemCount: PrivacyModel.privacySettings(context).length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap:
                        PrivacyModel.privacySettings(context)[i].voidCallback,
                    title: Text(
                      PrivacyModel.privacySettings(context)[i].title,
                      style: const TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      PrivacyModel.privacySettings(context)[i].subTitle,
                      style: const TextStyle(
                        color: Color(0xFF6A6A6A),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: PrivacyModel.privacySettings(context)[i].isSwitch
                        ? SizedBox(
                            width: 32,
                            height: 32,
                            child: CupertinoSwitch(
                                value: privacyModeVal, onChanged: onTapCall),
                          )
                        : const Icon(Icons.keyboard_arrow_right_rounded),
                  );
                })
          ],
        ),
      );

  void onTapCall(val) {
    setState(() {
      privacyModeVal = !privacyModeVal;
    });
  }
}

class PrivacyModel {
  final String title;
  final String subTitle;
  final VoidCallback voidCallback;
  final bool isSwitch;

  PrivacyModel(
      {required this.title,
      required this.subTitle,
      required this.voidCallback,
      this.isSwitch = false});

  static List<PrivacyModel> privacySettings(context) => [
        PrivacyModel(
          title: 'Visibility',
          subTitle: 'Choose who can see your profile.',
          voidCallback: () {
            Go(context, routeName: PrivacyVisibilityView.routeName).to();
          },
        ),
        PrivacyModel(
            title: 'Privacy Mode',
            subTitle: 'Enable or disable private mode for incognito browsing.',
            voidCallback: () {},
            isSwitch: true),
        PrivacyModel(
          title: 'Blocked Users (24)',
          subTitle: 'The people you blocked are displayed here.',
          voidCallback: () {
            Go(context, routeName: BlockedUsersView.routeName).to();
          },
        ),
        PrivacyModel(
          title: 'Reported Users (24)',
          subTitle: 'The people you submitted report are displayed here.',
          voidCallback: () {
            Go(context, routeName: ReportedUsersView.routeName).to();
          },
        )
      ];
}
