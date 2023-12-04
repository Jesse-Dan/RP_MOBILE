// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/sign_up_view.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

import '../../../utils/components/app_divider.dart';

class LoginModeView extends StatelessWidget {
  static String routeName = '/login.mode';
  LoginModeView({super.key});

  List<ActionBtns> btns = [
    ActionBtns(
        icon: 'assets/images/google.svg',
        text: 'Continue with Google',
        voidCallback: () {}),
    ActionBtns(
        icon: 'assets/images/facebook_logo.svg',
        text: 'Continue with Facebook',
        voidCallback: () {}),
    ActionBtns(
        icon: 'assets/images/appe_logo.svg',
        text: 'Continue with Apple',
        voidCallback: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      physics: const BouncingScrollPhysics(),
      refreshable: false,
      addbodyPadding: true,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: (AppDimentions.k20 * 2) + 4),
            Image.asset(
              'assets/images/MainLogo.png',
              width: 180,
              height: 70,
            ),
            const SizedBox(height: AppDimentions.k20 * 3),
            Text('Let’s get you in your account!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2),
            const SizedBox(height: AppDimentions.k20 + 13),
            ListView.builder(
              shrinkWrap: true,
              itemCount: btns.length,
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: btns[i].voidCallback,
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: AppDimentions.k20 + 4),
                  height: (AppDimentions.k20 * 2) + 16,
                  decoration: BoxDecoration(
                      color: AppColors.kbrandWhite,
                      border:
                          Border.all(color: AppColors.kgrayColor100, width: 1),
                      borderRadius:
                          BorderRadius.circular(AppDimentions.k20 + 8)),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        btns[i].icon,
                        width: 23.99986,
                        height: 24,
                      ),
                      const SizedBox(width: AppDimentions.k16),
                      Text(
                        btns[i].text,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDimentions.k20 + 12),
            SizedBox(
              height: AppDimentions.k20 + 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppDivider.build(
                      width: 166, height: 0.2, color: AppColors.kgrayColor700),
                  const SizedBox(height: AppDimentions.k16),
                  Text('or',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppColors.kgrayColor700)),
                  const SizedBox(height: AppDimentions.k16),
                  AppDivider.build(
                      width: 166, height: 0.2, color: AppColors.kgrayColor700),
                ],
              ),
            ),
            const SizedBox(height: AppDimentions.k20 + 12),
            AppButton(
              buttonType: ButtonType.LONG_BTN,
              btnText: 'Log in',
              btnColor: AppColors.kprimaryColor600,
              onTap: () {
                Go(context, routeName: LoginModeView.routeName).to();
              },
            ),
            const SizedBox(height: AppDimentions.k20 + 4),
            Text.rich(TextSpan(
                style: Theme.of(context).textTheme.subtitle1,
                children: [
                  const TextSpan(text: 'Don’t have an account?'),
                  TextSpan(
                      recognizer:
                          Go(context, routeName: RegistrationView.routeName)
                              .onTapRecognizeGesture(),
                      text: 'Sign up',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: AppColors.kprimaryColor600,
                            fontWeight: FontWeight.w700,
                          ))
                ]))
          ],
        ),
      ),
    );
  }
}

class ActionBtns {
  final String icon;
  final String text;
  final VoidCallback voidCallback;

  ActionBtns(
      {required this.icon, required this.text, required this.voidCallback});
}
