// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/components/app_notifier.dart';
import 'package:recenth_posts/src/utils/components/app_text_field.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../../../../utils/components/app_simple_app_bar.dart';
import '../../../../base/base_scaffold.dart';

class ProfileDetailView extends StatefulWidget {
  static const String routeName = '/profile.view.settings.profile';

  const ProfileDetailView({
    super.key,
  });

  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ProfileDetailView> {
  ScrollController scrollController = ScrollController();
  TextEditingController fullNameCtl = TextEditingController();
  TextEditingController userNameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController countryCtl = TextEditingController();
  TextEditingController bioCtl = TextEditingController();

  String? countryVal;

  bool edit = false;

  @override
  Widget build(BuildContext context) => BaseScaffold(
        addAppBar: true,
        addSafeArea: false,
        addbodyPadding: true,
        appBar: AppSimpleAppBar(context, title: 'Edit Profile'),
        physics: const BouncingScrollPhysics(),
        backgroundColor: AppColors.kbrandWhite,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/100x100"),
                        fit: BoxFit.fill,
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    right: 3,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: AppColors.kprimaryColor700,
                            borderRadius: BorderRadius.circular(4)),
                        child: SvgPicture.asset(
                          'assets/icons/magicpen.svg',
                          color: AppColors.kbrandWhite,
                          height: 18,
                          width: 18,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppTextField(
                  isEnabled: edit,
                  labelText: 'Full name',
                  hintText: 'Marcel Ramos',
                  controller: fullNameCtl),
              AppTextField(
                  isEnabled: edit,
                  labelText: 'User name',
                  hintText: '@MR12345678',
                  controller: userNameCtl),
              AppTextField(
                  isEnabled: edit,
                  labelText: 'Email',
                  hintText: 'jacobjones@gmail.com',
                  controller: emailCtl),
              AppTextField(
                isEnabled: edit,
                labelText: 'Country',
                hintText: 'Nigeria',
                controller: countryCtl,
                textFieldType: TextFieldType.DROPDOWN,
                items: const ['Nigeria', 'China', 'Kenya', 'Chana', 'UK', 'US'],
                value: countryVal,
              ),
              AppTextField(
                isEnabled: edit,
                labelText: 'Bio',
                hintText:
                    'Passionate about technology, enjoys sharing insights about the digital world.s',
                controller: bioCtl,
                textFieldType: TextFieldType.TEXT,
              ),
              const SizedBox(height: 105),
              edit
                  ? AppButton(
                      btnText: 'Save chances',
                      buttonType: ButtonType.LONG_BTN,
                      onTap: () {
                        AppNotifier.notifyAction(context,
                            message: 'Profile update successful');
                        setState(() {
                          edit = false;
                        });
                      },
                    )
                  : AppButton(
                      btnText: 'Edit profile',
                      buttonType: ButtonType.LONG_BTN,
                      addBorder: true,
                      borderColor: AppColors.kprimaryColor700,
                      btnColor: AppColors.kbrandWhite,
                      btnTextColor: AppColors.kprimaryColor700,
                      onTap: () {
                        setState(() {
                          edit = !edit;
                        });
                      },
                    ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
}
