// ignore_for_file: deprecated_member_use

import 'package:recenth_posts/src/logic/services/handler/handlers/error_handler.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/loading_handler.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/success_handler.dart';
import 'package:recenth_posts/src/logic/services/mixins/validator.dart';
import 'package:recenth_posts/src/utils/components/base_form_body.dart';
import 'package:recenth_posts/src/view/auth/otp_view/otp_view.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/sign_up_bloc/sign_up_bloc_bloc.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/sign_up_bloc/sign_up_bloc_event.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/sign_up_bloc/sign_up_bloc_state.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/model/payload/signup_payload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';

import '../../../utils/components/app_button.dart';
import '../../../utils/components/app_text_field.dart';
import '../../../utils/enums/enums.dart';
import '../../../utils/style/app_colors.dart';
import '../../../utils/style/app_dimentions.dart';
import '../../base/base_scaffold.dart';
import '../sign_in_view/sign_in_view.dart';

class RegistrationView extends StatefulWidget {
  static const routeName = '/reg.view';

  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView>
    with ValidatorMixin {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _secretkeyController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool check = false;
  bool isNewUser = true;
  bool hide = true;
  bool hide2 = true;

  String? value;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBlocBloc, SignUpBlocState>(
        listener: (context, state) {
          if (state is SignUpSuccessfullState) {
            Go(context).pop();
            SuccessHandler(
                context: context,
                message: state.signUpResponse.message,
                handlerBtnCount: HandlerBtnCount.one,
                callBackTextOne: 'Verify Email',
                callBack: () {
                  Go(context,
                      routeName: OtpView.routeName,
                      arguments: MyRouteArguments(arguments: [
                        {'email': _emailController.text}
                      ])).to();
                });
          }
          if (state is ErrorSignUpBlocState) {
            Go(context).pop();
            ErrorHandler(
                context: context,
                message: state.errorMessage,
                handlerBtnCount: HandlerBtnCount.one,
                callBackTextOne: 'Ok',
                callBack: () {
                  Go(context).pop();
                });
          }
          if (state is LoadingSignUpState) {
            LoadingHandler(context: context);
          }
        },
        child: BaseScaffold(
          refreshable: false,
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
                      'Let’s get started!',
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
                      'Complete your account setup by telling us a little about yourself!',
                      style: TextStyle(
                        color: Color(0xFF6A6A6A),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ]),
              ),
            ],
            formKey: _formKey,
            bottomChildren: [
              const SizedBox(height: AppDim.k20 * 1.5),
              AppTextField(
                controller: _firstNameController,
                labelText: 'First Name',
                hintText: 'Enter your first name',
                textFieldType: TextFieldType.TEXT,
                keyboardType: TextInputType.name,
                validator: (_) => validateTextField(_!),
              ),
              const SizedBox(height: AppDim.k12 - 2),
              AppTextField(
                controller: _lastNameController,
                labelText: 'Last Name',
                hintText: 'Enter your last name',
                textFieldType: TextFieldType.TEXT,
                keyboardType: TextInputType.name,
                validator: (_) => validateTextField(_!),
              ),
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
                validator: (_) => validatePassword(_!),
              ),
              const SizedBox(height: AppDim.k12 - 2),
              AppTextField(
                controller: _confirmPasswordController,
                labelText: 'Confirm Password',
                hintText: 'Confirm your  P@\$\$word',
                textFieldType: TextFieldType.PASSWORD,
                obscureText: hide2,
                keyboardType: TextInputType.visiblePassword,
                onSufficIconClicked: () {
                  setState(() {
                    hide2 = !hide2;
                  });
                },
                validator: (_) => validateConfirmPassword(
                    _passwordController.text, _confirmPasswordController.text),
              ),
              const SizedBox(height: AppDim.k12 - 2),
              AppTextField(
                controller: _secretkeyController,
                labelText: 'Secret Key',
                hintText: 'Enter a secret key',
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
              const SizedBox(height: AppDim.k16 * 2),
              SizedBox(
                width: 382,
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text:
                            'By clicking the sign up button, i confirm that i have read and understand the RecenthPosts ',
                        style: TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Use',
                        style: TextStyle(
                          color: AppColors.kprimaryColor600,
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: AppColors.kprimaryColor600,
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const TextSpan(
                        text: 'and ',
                        style: TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: AppColors.kprimaryColor600,
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppDim.k16),
              AppButton(
                flex: false,
                disabled: false,
                btnText: 'Register',
                buttonType: ButtonType.LONG_BTN,
                addboxShadow: true,
                boxShadowColor: AppColors.kwineColor.withOpacity(.07),
                onTap: () {
                  // if (_formKey.currentState!.validate()) {
                  context.read<SignUpBlocBloc>().add(LoadSignUpBlocEvent(
                      signUpPayload: SignUpPayload(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          email: _emailController.text,
                          secreatKey: _secretkeyController.text,
                          password: _passwordController.text)));
                  // }
                },
              ),
              const SizedBox(height: AppDim.k16),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w400)),
                      TextSpan(
                          recognizer:
                              Go(context, routeName: LoginView.routeName)
                                  .onTapRecognizeGesture(),
                          text: 'Login',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColors.kprimaryColor600,
                                  fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppDim.k20 * 10),
            ],
          ),
        ));
  }
}
