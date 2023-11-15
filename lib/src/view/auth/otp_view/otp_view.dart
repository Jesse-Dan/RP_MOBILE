import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

import '../../../logic/services/validator/validator.dart';
import '../../../utils/components/app_button.dart';
import '../../../utils/components/app_text_field.dart';
import '../../../utils/constants/global_constants.dart';
import '../../../utils/enums/enums.dart';
import '../../../utils/style/app_colors.dart';
import '../reset_password_view/reset_password_view.dart';

class OtpView extends StatefulWidget {
  static const routeName = '/otp.view';

  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> with ValidatorMixin {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                SizedBox(height: (GlobalConstants.k20 + 10).h),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Otp Verification',
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
                SizedBox(height: (GlobalConstants.k20 + 10).h),
                AppTextField(
                  controller: _otpController,
                  labelText: 'One time Password',
                  hintText: 'Enter Otp',
                  textFieldType: TextFieldType.OTP,
                  obscureText: hide2,
                  keyboardType: TextInputType.number,
                  onSufficIconClicked: () {
                    setState(() {
                      hide2 = !hide2;
                    });
                  },
                  validator: (_) => validateTextField(_ ?? ''),
                ),
                SizedBox(height: (GlobalConstants.k20 + 10).h),
                AppButton(
                  btnText: 'Continue',
                  buttonType: ButtonType.LONG_BTN,
                  addboxShadow: true,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Go(context, routeName: ResetPasswordView.routeName).to();
                      if (kDebugMode) {
                        print('validated');
                      }
                    }
                  },
                ),
                const SizedBox(height: (GlobalConstants.k12 - 2) * 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
