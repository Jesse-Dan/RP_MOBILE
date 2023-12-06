// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/custom_handler.dart';
import 'package:recenth_posts/src/logic/services/validator/validator.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/components/base_form_body.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/sign_up_view.dart';
import 'package:recenth_posts/src/view/base/base_app.dart';

import '../../../utils/components/app_check_box.dart';
import '../../../utils/components/app_text_field.dart';
import '../../../utils/style/app_colors.dart';
import '../../../utils/style/app_dimentions.dart';
import '../../base/base_scaffold.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login.view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ValidatorMixin {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool check = false;
  bool isNewUser = true;
  bool hide = true;
  bool hide2 = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      refreshable: true,
      onRefresh: () async {},
      backgroundColor: AppColors.kprimaryColor100,
      addAppBar: true,
      physics: const NeverScrollableScrollPhysics(),
      body: BaseFormBody.build(
        context,
        topChildren: [
          const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimentions.k16, vertical: AppDimentions.k20),
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Welcome back!',
                    style: TextStyle(
                      color: Color(0xFF0B0B0B),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Please enter your email & password to sign in.',
                    style: TextStyle(
                      color: Color(0xFF6A6A6A),
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ]))
        ],
        formKey: _formKey,
        bottomChildren: [
          const SizedBox(height: AppDimentions.k12 - 2),
          AppTextField(
            controller: _emailController,
            labelText: 'Email address',
            hintText: 'Enter your email',
            textFieldType: TextFieldType.TEXT,
            keyboardType: TextInputType.emailAddress,
            validator: (_) => validateEmail(_!),
          ),
          const SizedBox(height: AppDimentions.k12 - 2),
          AppTextField(
            controller: _passwordController,
            labelText: 'Password',
            hintText: 'Enter a secured P@\$sw0rd',
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
          const SizedBox(height: AppDimentions.k20 + 4),
          Row(
            children: [
              Expanded(
                child: AppCheckBox(
                  isChecked: check,
                  onChanged: (bool value) {
                    setState(() {
                      check = value;
                    });
                  },
                  textPosition: CheckBoxTextPosition.right,
                  rightText: 'Keep me signed in',
                  enabledColor: AppColors.kprimaryColor600,
                  disabledColor: AppColors.kdotGrey,
                  emptyColor: AppColors.kdotGrey,
                  textColor: AppColors.kblackColor,
                ),
              ),
              const Text(
                'Forgot password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFF48B99),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0.09,
                ),
              )
            ],
          ),
          const SizedBox(height: AppDimentions.k20 + 4),
          AppButton(
            flex: false,
            disabled: false,
            btnText: 'Log in',
            buttonType: ButtonType.LONG_BTN,
            onTap: () {
              // if (_formKey.currentState!.validate()) {}
              AppHandler(
                message:
                    'Please wait...\nYou will be directed to the homepage.',
                context: context,
                title: 'Sign in Successful!',
                tag: Tag.PERSON_SUCCESS,
              );
              Timer(const Duration(seconds: 2), () {
                Go(context, routeName: BaseApp.routeName).toAndClearAll();
              });
            },
          ),
          const SizedBox(height: AppDimentions.k16),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Don’t have an account? ',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.w400)),
                  TextSpan(
                      recognizer:
                          Go(context, routeName: RegistrationView.routeName)
                              .onTapRecognizeGesture(),
                      text: 'Sign up',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: AppColors.kprimaryColor600,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimentions.k20 * 10),
        ],
      ),
    );
  }
}
