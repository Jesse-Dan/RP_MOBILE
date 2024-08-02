// ignore_for_file: deprecated_member_use
import 'package:recenth_posts/src/logic/services/handler/base_handler.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/sign_in_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';

import '../../../../../utils/components/app_simple_app_bar.dart';
import '../../../../base/base_scaffold.dart';

class SecurityView extends StatefulWidget {
  static const String routeName = '/profile.view.settings.security';

  const SecurityView({
    super.key,
  });

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  ScrollController scrollController = ScrollController();
  bool privacyModeVal = false;
  bool privacyModeVa2 = false;
  bool privacyModeVal3 = false;

  void onTapCall(bool value) {
    setState(() {
      privacyModeVal = !privacyModeVal;
    });
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
      addAppBar: true,
      addSafeArea: false,
      addbodyPadding: true,
      appBar: AppSimpleAppBar(context, title: 'Security'),
      physics: const BouncingScrollPhysics(),
      backgroundColor: AppColors.kbrandWhite,
      body: Column(
        children:
            List.generate(SecurityModel.privacySettings(context).length, (i) {
          return SecurityModel.privacySettings(context)[i].isSwitch
              ? ListTile(
                  onTap: SecurityModel.privacySettings(context)[i].voidCallback,
                  title: Text(
                    SecurityModel.privacySettings(context)[i].title,
                    style: TextStyle(
                      color: AppColors.kerrorColor500,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    SecurityModel.privacySettings(context)[i].subTitle ?? '',
                    style: TextStyle(
                      color: AppColors.kgrayColor700,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(Icons.arrow_forward_ios_rounded)))
              : ListTile(
                  onTap: SecurityModel.privacySettings(context)[i].voidCallback,
                  title: Text(
                    SecurityModel.privacySettings(context)[i].title,
                    style: const TextStyle(
                      color: Color(0xFF232323),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: SizedBox(
                    width: 24,
                    height: 10,
                    child: CupertinoSwitch(
                        value: privacyModeVal, onChanged: onTapCall),
                  ));
        }),
      ));
}

class SecurityModel {
  final String title;
  final String? subTitle;
  final VoidCallback voidCallback;
  final bool isSwitch;

  SecurityModel({
    required this.title,
    this.subTitle,
    required this.voidCallback,
    this.isSwitch = false,
  });

  static List<SecurityModel> privacySettings(context) => [
        SecurityModel(
          title: 'Remember me',
          voidCallback: () {},
        ),
        SecurityModel(
          title: 'Biometric ID',
          voidCallback: () {},
        ),
        SecurityModel(
          title: 'Face ID',
          voidCallback: () {},
        ),
        SecurityModel(
          title: 'Delete Account',
          isSwitch: true,
          subTitle: 'Permanently remove your profile and data from RecentPost.',
          voidCallback: () {
            BaseHandler(
              context: context,
              tag: Tag.SERVICE_ACTION,
              title: 'Delete Account',
              message: 'Are you sure you want to delete your account?',
              callBackTwo: () async {
                Go(context).pop();
                BaseHandler(
                  tag: Tag.LOADING,
                  context: context,
                  title: 'Deleting Account',
                  message: 'Your Account is been deleted',
                );
                await Future.delayed(const Duration(seconds: 2));
                Go(context).pop();

                await Future.delayed(const Duration(seconds: 2));
                Go(context).pop();
                Go(context, routeName: LoginView.routeName)
                    .toAndReplaceAllNamedRoute();
              },
              callBackTextOne: 'cancel',
              callBackTextTwo: 'proceed',
            );
          },
        )
      ];
}
