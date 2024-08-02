import 'dart:async';
import 'package:recenth_posts/src/logic/services/handler/handlers/error_handler.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/loading_handler.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/success_handler.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/send_otp_bloc/send_otp_bloc.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/verify_otp_bloc/verify_otp_bloc_bloc.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/verify_otp_bloc/verify_otp_bloc_event.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/bloc/verify_otp_bloc/verify_otp_bloc_state.dart';
import 'package:recenth_posts/src/view/auth/sign_up_view/model/payload/verify_otp_payload.dart';
import 'package:recenth_posts/src/view/base/base_app.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';
import '../../../logic/services/mixins/validator.dart';
import '../../../utils/components/app_button.dart';
import '../../../utils/components/app_text_field.dart';
import '../../../utils/components/base_form_body.dart';
import '../../../utils/enums/enums.dart';
import '../../../utils/style/app_colors.dart';
import '../../../utils/style/app_dimentions.dart';
import '../sign_up_view/bloc/send_otp_bloc/send_otp_event.dart';

class OtpView extends StatefulWidget {
  final String? email;
  static const String routeName = '/otp.view';

  const OtpView({super.key, required this.email});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> with ValidatorMixin {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool hide = true;
  bool hide2 = true;

  @override
  void initState() {
    BlocProvider.of<SignUpSendOtpBloc>(context)
        .add(SendOtpBlocEvent(email: widget.email ?? 'error'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpVerifyOtpBloc, SignUpVerifyOtpBlocState>(
      listener: (context, state) {
        if (state is SignUpLoadingVerifyOtpBlocState) {
          LoadingHandler(context: context);
        }
        if (state is SignUpSuccessfullVerifyOtpBlocState) {
          Go(context).pop();
          SuccessHandler(
              context: context,
              message: state.signUpProcessCompleteResponse.message,
              handlerBtnCount: HandlerBtnCount.zero);
          Timer(const Duration(seconds: 3), () {
            Go(context,
                routeName: BaseApp.routeName,
                arguments: MyRouteArguments(arguments: [
                  {'currentIndex': 0}
                ])).to();
          });
        }
        if (state is ErrorVerifyOtpBlocState) {
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
      },
      child: BaseScaffold(
        addbodyPadding: true,
        backgroundColor: AppColors.kprimaryColor100,
        addSafeArea: true,
        body: BaseFormBody.build(
          context,
          topChildren: [
            const Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'One Time Password verification',
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
                  'Enter the otp send to your email',
                  style: TextStyle(
                    color: Color(0xFF6A6A6A),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ]),
          ],
          formKey: _formKey,
          bottomChildren: [
            const SizedBox(height: AppDim.k20 * 1.5),
            AppTextField(
              controller: _otpController,
              labelText: '',
              hintText: '',
              textFieldType: TextFieldType.OTP,
              keyboardType: TextInputType.number,
              validator: (_) => validateTextField(_!),
            ),
            const SizedBox(height: AppDim.k20 * 2),
            Align(
              alignment: Alignment.center,
              child: AppButton(
                  flex: false,
                  disabled: false,
                  btnText: 'Verify Otp',
                  buttonType: ButtonType.LONG_BTN,
                  addboxShadow: true,
                  boxShadowColor: AppColors.kwineColor.withOpacity(.07),
                  onTap: () {
                    context.read<SignUpVerifyOtpBloc>().add(
                        LoadVerifyOtpBlocEvent(
                            verifyOtpPayload:
                                VerifyOtpPayload(otp: _otpController.text)));
                  }),
            ),
            const SizedBox(height: AppDim.k20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Didn\'t get the Otp? ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w400)),
                    TextSpan(
                        // recognizer:Ontap,
                        text: 'ResendOtp',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
