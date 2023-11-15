import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/logic/services/validator/validator.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/components/app_text_field.dart';
import 'package:recenth_posts/src/view/auth/otp_view/otp_view.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

import '../../../utils/constants/global_constants.dart';
import '../../../utils/enums/enums.dart';
import '../../../utils/style/app_colors.dart';

class ForgotPasswordView extends StatefulWidget {
  static const routeName = '/forgot.password.view';

  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView>
    with ValidatorMixin {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: true,
      body: Stack(
        children: [
          Image.asset('assets/images/TopBg.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 100.h),
              SizedBox(height: (GlobalConstants.k20 + 10).h),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Forgotten password',
                  style: TextStyle(
                    color: AppColors.kwineColor,
                    fontSize: 32,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: GlobalConstants.k16.h),
              Align(
                alignment: Alignment.topCenter,
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    const TextSpan(
                        text:
                            'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.'),
                    TextSpan(
                      text: '',
                      style: TextStyle(
                        color: AppColors.kpouchBlue.withOpacity(0.5),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                  style: TextStyle(
                    color: AppColors.klightBlackColor.withOpacity(0.7),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: ((GlobalConstants.k20 + 4) * 3).h),
              AppTextField(
                  controller: _emailController,
                  labelText: 'Email I’D/ Mobile Number',
                  hintText: 'Enter email linked to your account'),
              SizedBox(height: (GlobalConstants.k20 + 4).h),
              AppButton(
                btnText: 'Continue',
                buttonType: ButtonType.LONG_BTN,
                addboxShadow: true,
                onTap: () {
                  Go(context, routeName: OtpView.routeName).to();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
