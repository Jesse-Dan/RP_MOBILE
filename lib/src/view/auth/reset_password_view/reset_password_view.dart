import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

import '../../../logic/services/mixins/validator.dart';
import '../../../utils/components/app_button.dart';
import '../../../utils/components/app_text_field.dart';
import '../../../utils/enums/enums.dart';
import '../../../utils/style/app_colors.dart';
import '../../../utils/style/app_dimentions.dart';

class ResetPasswordView extends StatefulWidget {
  static const routeName = '/reset.password.view';

  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView>
    with ValidatorMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool hide = true;
  bool hide2 = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: true,
      body: Stack(
        children: [
          Image.asset('assets/images/TopBg.png'),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 100.h),
                SizedBox(height: (AppDim.k20 + 10).h),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      color: AppColors.kwineColor,
                      fontSize: 32,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: AppDim.k16.h),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      const TextSpan(
                          text:
                              'Enter the OTP code we just sentyou on your registered Email/Phone number'),
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
                SizedBox(height: (AppDim.k20 + 4).h),
                AppTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  textFieldType: TextFieldType.PASSWORD,
                  obscureText: hide,
                  keyboardType: TextInputType.visiblePassword,
                  onSufficIconClicked: () {
                    setState(() {
                      hide = !hide;
                    });
                  },
                  validator: (_) => validatePassword(_!),
                ),
                const SizedBox(height: AppDim.k14),
                AppTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                  textFieldType: TextFieldType.PASSWORD,
                  obscureText: hide2,
                  keyboardType: TextInputType.visiblePassword,
                  onSufficIconClicked: () {
                    setState(() {
                      hide2 = !hide2;
                    });
                  },
                  validator: (_) => validateConfirmPassword(
                      _passwordController.text,
                      _confirmPasswordController.text),
                ),
                SizedBox(height: AppDim.k20.h),
                AppButton(
                  btnText: 'Reset Password',
                  buttonType: ButtonType.LONG_BTN,
                  addboxShadow: true,
                  loading: true,
                  loadingText: 'resetting',
                  onTap: () {
                    Go(context, routeName: ResetPasswordView.routeName).to();
                  },
                ),
                const SizedBox(height: (AppDim.k12 - 2) * 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
