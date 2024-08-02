// ignore_for_file: deprecated_member_use

import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_assets.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/sign_in_view.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/sign_up_view.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';

import '../../../utils/components/app_divider.dart';

// ignore: must_be_immutable
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
            const SizedBox(height: (AppDim.k20 * 2) + 4),
            Image.asset(
              AppAsset.mainGreenLogoNoBG,
              width: 180,
              height: 100,
            ),
            const SizedBox(height: AppDim.k20 * 3),
            Text('Let’s get you in your account!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: AppDim.k20 + 13),
            ListView.builder(
              shrinkWrap: true,
              itemCount: btns.length,
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: btns[i].voidCallback,
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: AppDim.k20 + 4),
                  height: (AppDim.k20 * 2) + 16,
                  decoration: BoxDecoration(
                      color: AppColors.kbrandWhite,
                      border:
                          Border.all(color: AppColors.kgrayColor100, width: 1),
                      borderRadius: BorderRadius.circular(AppDim.k20 + 8)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          btns[i].icon,
                          width: 23.99986,
                          height: 24,
                        ),
                        const Spacer(),
                        Text(
                          btns[i].text,
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDim.k20 + 12),
            SizedBox(
              height: AppDim.k20 + 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppDivider.build(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 0.2,
                      color: AppColors.kgrayColor700),
                  const SizedBox(height: AppDim.k16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: AppColors.kgrayColor700)),
                  ),
                  const SizedBox(height: AppDim.k16),
                  AppDivider.build(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 0.2,
                      color: AppColors.kgrayColor700),
                ],
              ),
            ),
            const SizedBox(height: AppDim.k20 + 12),
            AppButton(
              buttonType: ButtonType.LONG_BTN,
              btnText: 'Log in',
              btnColor: AppColors.kprimaryColor600,
              onTap: () {
                Go(context, routeName: LoginView.routeName).to();
              },
            ),
            const SizedBox(height: AppDim.k20 + 4),
            Text.rich(TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  const TextSpan(text: 'Don’t have an account?'),
                  TextSpan(
                      recognizer:
                          Go(context, routeName: RegistrationView.routeName)
                              .onTapRecognizeGesture(),
                      text: 'Sign up',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
