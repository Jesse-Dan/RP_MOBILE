// ignore_for_file: deprecated_member_use

import 'package:recenth_posts/src/logic/services/handler/handlers/error_handler.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/loading_handler.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/success_handler.dart';
import 'package:recenth_posts/src/logic/services/mixins/validator.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/components/base_form_body.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/auth/otp_view/otp_view.dart';
import 'package:recenth_posts/src/view/auth/sign_in_view/bloc/sign_in_bloc/index.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/sign_up_view.dart';
import 'package:recenth_posts/src/view/base/base_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';

import '../../../utils/components/app_check_box.dart';
import '../../../utils/components/app_text_field.dart';
import '../../../utils/style/app_colors.dart';
import '../../../utils/style/app_dimentions.dart';
import '../../base/base_scaffold.dart';
import 'models/signin_payload.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login.view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ValidatorMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool check = false;
  bool hide = true;
  bool hide2 = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBlocBloc, SignInBlocState>(
      listener: (context, state) {
        if (state is SuccessfullSignInBlocState) {
          Go(context).pop();
          SuccessHandler(
            context: context,
            message: state.response.message ?? 'Null',
            callBackTextOne: 'Proceed',
            handlerBtnCount: HandlerBtnCount.one,
            callBack: () {
              Go(context, routeName: BaseApp.routeName).to();
            },
          );
        }

        if (state is ErrorSignInBlocState) {
          Go(context).pop();
          ErrorHandler(
              context: context,
              message: state.errorMessage,
              handlerBtnCount: HandlerBtnCount.one,
              callBackTextOne: 'Ok');
        }
        if (state is LoadingSignInBlocState) {
          LoadingHandler(context: context);
        }
      },
      child: BaseScaffold(
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
                    horizontal: AppDim.k16, vertical: AppDim.k20),
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
            const SizedBox(height: AppDim.k12 - 2),
            AppTextField(
              controller: _emailController,
              labelText: 'Email address',
              hintText: 'Enter your email',
              textFieldType: TextFieldType.TEXT,
              keyboardType: TextInputType.emailAddress,
              validator: (_) => validateEmail(_!),
            ),
            const SizedBox(height: AppDim.k12 - 2),
            AppTextField(
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Enter a secured P@\$\$word',
              textFieldType: TextFieldType.PASSWORD,
              obscureText: hide,
              keyboardType: TextInputType.visiblePassword,
              onSufficIconClicked: () {
                setState(() {
                  hide = !hide;
                });
              },
              // validator: (_) => validatePassword(_!),
            ),
            const SizedBox(height: AppDim.k20 + 4),
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
                GestureDetector(
                  onTap: () {
                    Go(context, routeName: OtpView.routeName).to();
                  },
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.kprimaryColor600,
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w600,
                      height: 0.09,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: AppDim.k20 + 4),
            AppButton(
              flex: false,
              disabled: false,
              btnText: 'Log in',
              buttonType: ButtonType.LONG_BTN,
              onTap: () {
                // Go(context, routeName: BaseApp.routeName).to();

                if (_formKey.currentState!.validate()) {
                  context.read<SignInBlocBloc>().add(LoginEvent(
                      signinPayload: SigninPayload(
                          email: _emailController.text,
                          password: _passwordController.text)));
                }
              },
            ),
            const SizedBox(height: AppDim.k16),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Don’t have an account? ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w400)),
                    TextSpan(
                        recognizer:
                            Go(context, routeName: RegistrationView.routeName)
                                .onTapRecognizeGesture(),
                        text: 'Sign up',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.kprimaryColor600,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDim.k20 * 10),
          ],
        ),
      ),
    );
  }
}
