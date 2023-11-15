import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/logic/services/validator/validator.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../../../utils/components/app_check_box.dart';
import '../../../utils/components/app_text_field.dart';
import '../../../utils/constants/global_constants.dart';
import '../../../utils/style/app_colors.dart';
import '../../base/base_scaffold.dart';
import '../forgot_password_fill_email_view/forget_password_view.dart';
import '../sign_up_view/sign_up_view.dart';
import 'components/social_btn.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login.view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ValidatorMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool check = false;
  bool isNewUser = false;
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addSafeArea: true,
      addbodyPadding: true,
      body: Stack(
        children: [
          Image.asset('assets/images/TopBg.png'),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 100.h),
                SizedBox(height: (GlobalConstants.k20 + 10).h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign In',
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
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(children: [
                      const TextSpan(text: 'Welcome Back'),
                      TextSpan(
                        text: ' Williams Daniel !',
                        style: TextStyle(
                          color: AppColors.kpouchBlue.withOpacity(0.5),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ]),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.klightBlackColor.withOpacity(0.7),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: GlobalConstants.k20 * 1.5),
                AppTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  textFieldType: TextFieldType.TEXT,
                  validator: (_) => validateEmail(_ ?? ''),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: GlobalConstants.k16),
                AppTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  textFieldType: TextFieldType.PASSWORD,
                  obscureText: hide,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (_) => validatePassword(_ ?? ''),
                  onSufficIconClicked: () {
                    setState(() {
                      hide = !hide;
                    });
                  },
                ),
                const SizedBox(height: GlobalConstants.k16 + 4),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Go(context, routeName: ForgotPasswordView.routeName).to();
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: AppColors.kpouchBlue.withOpacity(0.4),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(height: (GlobalConstants.k12 - 2) * 5),
                // isNewUser
                //     ? const SizedBox.shrink()
                //     :
                AppCheckBox(
                  isChecked: check,
                  onChanged: (bool value) {
                    setState(() {
                      check = value;
                    });
                  },
                  textPosition: CheckBoxTextPosition.right,
                  rightText: 'Keep me signed in',
                  enabledColor: AppColors.kpouchBlue,
                  disabledColor: AppColors.kdotGrey,
                  emptyColor: AppColors.kdotGrey,
                  textColor: AppColors.kblackColor,
                ),
                const SizedBox(height: GlobalConstants.k16),
                AppButton(
                  btnText: 'Sign in',
                  buttonType: ButtonType.LONG_BTN,
                  addboxShadow: true,
                  boxShadowColor: AppColors.kwineColor.withOpacity(.07),
                  onTap: () {
                    // if (_formKey.currentState!.validate()) {
                    //   print('validated');

                    Go(context, routeName: RegistrationView.routeName).to();
                    // }
                  },
                ),
                const SizedBox(height: GlobalConstants.k20),

                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: AppColors.kpouchBlue.withOpacity(0.2),
                        width: 150.w,
                        height: 1.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or',
                          style: TextStyle(
                            color: Color(0xFF979797),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.50,
                          ),
                        ),
                      ),
                      Container(
                        color: AppColors.kpouchBlue.withOpacity(0.2),
                        width: 150.w,
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: GlobalConstants.k20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SocialButton(
                        imageWidget:
                            SvgPicture.asset('assets/images/_Facebook.svg'),
                        buttonText: 'Facebook'),
                    const SizedBox(height: GlobalConstants.k16),
                    SocialButton(
                        imageWidget:
                            SvgPicture.asset('assets/images/google.svg'),
                        buttonText: 'Google')
                  ],
                ),
                const SizedBox(height: GlobalConstants.k20 + 40),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Don’t have an account?',
                          style: TextStyle(
                            color: Color(0xFF979797),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0.12,
                            letterSpacing: 0.50,
                          ),
                        ),
                        const TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0.12,
                            letterSpacing: 0.50,
                          ),
                        ),
                        TextSpan(
                          recognizer:
                              Go(context, routeName: RegistrationView.routeName)
                                  .onTapRecognizeGesture(),
                          text: 'Sign up',
                          style: TextStyle(
                            color: AppColors.kpouchBlue,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0.12,
                            letterSpacing: 0.50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: (GlobalConstants.k16 * 2) + 7),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element, non_constant_identifier_names
  Column _Cfield(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Image.asset('assets/images/TopBg.png'),
            Positioned(
              top: 20,
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Go(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 15,
                    color: AppColors.kblackColor,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: GlobalConstants.k16 + 2),
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/images/rp_logo_with_text.png',
            width: 218,
            height: 38,
          ),
        ),
        const SizedBox(height: GlobalConstants.k16 * 2.5),
        const Text(
          'Sign in',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const SizedBox(height: GlobalConstants.k12 - 2),
        const Text(
          'Welcome back!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const SizedBox(height: (GlobalConstants.k16 * 2) + 7),
        AppTextField(controller: _emailController, hintText: 'Email'),
        const SizedBox(height: GlobalConstants.k20),
        AppTextField(
            controller: _passwordController,
            hintText: 'Password',
            obscureText: true),
        const SizedBox(height: GlobalConstants.k16 + 4),
        const Align(
          alignment: Alignment.topRight,
          child: Text(
            'Forgot password?',
            style: TextStyle(
              color: Color(0xFF191D23),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              height: 0.09,
            ),
          ),
        ),
        const SizedBox(height: (GlobalConstants.k12 - 2) * 3),
        AppCheckBox(
          isChecked: check,
          onChanged: (bool value) {
            setState(() {
              check = value;
            });
          },
          textPosition: CheckBoxTextPosition.right,
          rightText: 'Keep me signed in',
          enabledColor: AppColors.kpouchBlue,
          disabledColor: AppColors.kdotGrey,
          emptyColor: AppColors.kdotGrey,
        ),
        const SizedBox(height: GlobalConstants.k12 - 2),
        AppButton(
          btnText: 'Sign in',
          buttonType: ButtonType.LONG_BTN,
        ),
        const SizedBox(height: GlobalConstants.k16 * 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: AppColors.kpouchBlue,
              width: 111.w,
              height: 1.h,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Or login with',
                style: TextStyle(
                  color: Color(0xFF979797),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.50,
                ),
              ),
            ),
            Container(
              color: AppColors.kpouchBlue,
              width: 111.w,
              height: 1.h,
            ),
          ],
        ),
        const SizedBox(height: GlobalConstants.k16 * 2),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: GlobalConstants.k12 - 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              // AppButton(
              //   btnColor: AppColors.kWhiteColor,
              //   btnTextColor: AppColors.kblackColor.withOpacity(0.6),
              //   buttonType: ButtonType.SHORT_BTN,
              //   width: 167,
              //   addboxShadow: true,
              //   btnContentType: BtnContentType.IMG,
              //   btnContent: Image.asset('assets/images/google.png'),
              // ),
              // AppButton(
              //   btnColor: AppColors.kWhiteColor,
              //   btnTextColor: AppColors.kblackColor.withOpacity(0.6),
              //   buttonType: ButtonType.SHORT_BTN,
              //   width: 167,
              //   addboxShadow: true,
              //   btnContentType: BtnContentType.IMG,
              //   btnContent: SvgPicture.asset('assets/images/fb.svg'),
              // )
            ],
          ),
        ),
        const SizedBox(height: (GlobalConstants.k16 * 2) + 7),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Don’t have an account?',
                  style: TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: 0.50,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: 0.50,
                  ),
                ),
                TextSpan(
                  recognizer: Go(context, routeName: RegistrationView.routeName)
                      .onTapRecognizeGesture(),
                  text: 'Sign up',
                  style: TextStyle(
                    color: AppColors.kpouchBlue,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: 0.50,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: (GlobalConstants.k16 * 2) + 7),
      ],
    );
  }
}
