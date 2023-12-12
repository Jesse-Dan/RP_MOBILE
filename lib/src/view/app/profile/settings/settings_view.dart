// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:recenth_posts/src/view/app/profile/settings/subscriptions/subscriptions.dart';

import '../../../../utils/components/app_simple_app_bar.dart';
import '../../../base/base_scaffold.dart';

class SettingsView extends StatefulWidget {
  static const String routeName = '/profile.view.settings';

  const SettingsView({
    super.key,
  });

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) => BaseScaffold(
      addAppBar: true,
      addSafeArea: true,
      addbodyPadding: true,
      appbar: AppSimpleAppBar(context, title: 'Settings'),
      physics: const BouncingScrollPhysics(),
      backgroundColor: AppColors.kbrandWhite,
      body: ListView.builder(
        controller: scrollController,
        itemCount: Settings.settings(context).length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int i) =>
            SettingsTile(settings: Settings.settings(context)[i]),
      ));
}

class SettingsTile extends StatelessWidget {
  final Settings settings;
  const SettingsTile({
    super.key,
    required this.settings,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: settings.voidCallback,
        leading: SvgPicture.asset(
          'assets/icons/${settings.img}',
          height: 24,
          width: 24,
          color: settings.title == 'Log out'
              ? AppColors.kprimaryColor700
              : AppColors.kblackColor,
        ),
        contentPadding: const EdgeInsets.all(3),
        title: Padding(
          padding: const EdgeInsets.only(left: AppDimentions.k16),
          child: Text(settings.title,
              textAlign: TextAlign.left,
              style: settings.title == 'Log out'
                  ? TextStyle(
                      color: AppColors.kprimaryColor700,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.02,
                    )
                  : Theme.of(context).textTheme.subtitle1!),
        ),
        trailing: settings.title == 'Log out'
            ? null
            : const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              ),
      );
}

class Settings {
  final VoidCallback voidCallback;
  final String title;
  final String img;

  Settings(
      {required this.voidCallback, required this.title, required this.img});

  static List<Settings> settings(BuildContext context) => [
        Settings(voidCallback: () {}, title: 'Profile', img: 'profile.svg'),
        Settings(
            voidCallback: () {}, title: 'Verify Account', img: 'verify.svg'),
        Settings(
            voidCallback: () {},
            title: 'Change Password',
            img: 'solar_lock-outline.svg'),
        Settings(
            voidCallback: () {}, title: 'Customise ID', img: 'magicpen.svg'),
        Settings(
            voidCallback: () {},
            title: 'Privacy',
            img: 'material-symbols-light_privacy-tip-outline-rounded.svg'),
        Settings(
            voidCallback: () {
              Go(context,routeName: SubscritionsView.routeName).to();
            },
            title: 'Subscription',
            img: 'star.svg'),
        Settings(voidCallback: () {}, title: 'Payment Method', img: 'card.svg'),
        Settings(
            voidCallback: () {}, title: 'Security', img: 'carbon_security.svg'),
        Settings(
            voidCallback: () {},
            title: 'Language',
            img: 'iconoir_language.svg'),
        Settings(
            voidCallback: () {},
            title: 'Notifications',
            img: 'basil_notification-outline.svg'),
        Settings(
            voidCallback: () {}, title: 'Help Center', img: 'formkit_help.svg'),
        Settings(voidCallback: () {}, title: 'About', img: 'iconoir_page.svg'),
        Settings(
            voidCallback: () {}, title: 'Delete Account', img: 'trash.svg'),
        Settings(
            voidCallback: () {},
            title: 'Log out',
            img: 'humbleicons_logout.svg'),
      ];
}
