// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/logic/services/validator/validator.dart';
import 'package:recenth_posts/src/utils/components/base_form_body.dart';

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
  final TextEditingController _countryController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool check = false;
  bool isNewUser = true;
  bool hide = true;
  bool hide2 = true;

// dropdown related
  String? value;
  // Country? country;
  // (List<String>, List<Country>) countries(CountryState state) {
  //   if (state is CountryLoadingState) {
  //     return (const ['Loading...'], []);
  //   } else if (state is CountryLoadedState) {
  //     return (
  //       state.countryResponses.data!.map((country) => country.name!).toList(),
  //       state.countryResponses.data!.map((country) => country).toList()
  //     );
  //   } else {
  //     return (const ['Error fetching countries'], []);
  //   }
  // }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<CountryBloc>().add(
  //         GetAllCountryEvent(
  //           context.read<AppRepository>(),
  //         ),
  //       );
  // }

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
          const SizedBox(height: AppDimentions.k20 * 1.5),
          AppTextField(
            controller: _firstNameController,
            labelText: 'First Name',
            hintText: 'Enter your first name',
            textFieldType: TextFieldType.TEXT,
            keyboardType: TextInputType.name,
            validator: (_) => validateTextField(_!),
          ),
          const SizedBox(height: AppDimentions.k12 - 2),
          AppTextField(
            controller: _lastNameController,
            labelText: 'Last Name',
            hintText: 'Enter your last name',
            textFieldType: TextFieldType.TEXT,
            keyboardType: TextInputType.name,
            validator: (_) => validateTextField(_!),
          ),
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
            controller: _countryController,
            labelText: 'Country',
            hintText: 'Select country',
            textFieldType: TextFieldType.DROPDOWN,
            keyboardType: TextInputType.text,
            validator: (_) => validateTextField(_!),
            items: const ['Nigeria', 'Usa', 'Uk'],
            value: value,
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
          const SizedBox(height: AppDimentions.k12 - 2),
          AppTextField(
            controller: _confirmPasswordController,
            labelText: 'Confirm Password',
            hintText: 'Confirm your P@\$sw0rd',
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
          const SizedBox(height: (AppDimentions.k12 - 2) * 2),
          const SizedBox(
            width: 382,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'By clicking the sign up button, i confirm that i have read and understand the RecenthPost ',
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
                      color: Color(0xFFF48B99),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: Color(0xFF0B0B0B),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'and\n',
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
                      color: Color(0xFFF48B99),
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
          const SizedBox(height: AppDimentions.k12 - 2),
          AppButton(
            flex: false,
            disabled: false,
            btnText: 'Register',
            buttonType: ButtonType.LONG_BTN,
            addboxShadow: true,
            boxShadowColor: AppColors.kwineColor.withOpacity(.07),
            onTap: () {
              if (_formKey.currentState!.validate()) {}
            },
          ),
          const SizedBox(height: AppDimentions.k16),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.w400)),
                  TextSpan(
                      recognizer: Go(context, routeName: LoginView.routeName)
                          .onTapRecognizeGesture(),
                      text: 'Login',
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
