// ignore_for_file: deprecated_member_use
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/go/go_service.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/descion_handler.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/redirect_handler.dart';
import 'package:recenth_posts/src/utils/components/action_btn.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/components/web_view.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/view/app/profile/settings/subscriptions/all_subs/all_subs_view.dart';

import '../../../../../utils/components/app_divider.dart';
import '../../../../../utils/components/app_simple_app_bar.dart';
import '../../../../../utils/style/app_dimentions.dart';
import '../../../../base/base_scaffold.dart';

class SubscritionsView extends StatefulWidget {
  static const String routeName = '/profile.view.settings.subs';

  const SubscritionsView({
    super.key,
  });

  @override
  State<SubscritionsView> createState() => _SubscritionsViewState();
}

class _SubscritionsViewState extends State<SubscritionsView> {
  ScrollController scrollController = ScrollController();
  int currentSubIndex = 7;
  @override
  Widget build(BuildContext context) => BaseScaffold(
        addAppBar: true,
        addSafeArea: false,
        addbodyPadding: true,
        appbar: AppSimpleAppBar(context, title: 'Payment and Subscription'),
        physics: const BouncingScrollPhysics(),
        backgroundColor: AppColors.kbrandWhite,
        body: Column(children: [
          Container(
              color: AppColors.kbrandWhite,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: AppDimentions.k16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Payment Method',
                    style: TextStyle(
                      color: Color(0xFF8D8D8D),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: AppDimentions.k16),
                  Expanded(child: AppDivider.build(height: 1.5)),
                ],
              )),
          const SizedBox(height: AppDimentions.k16 + 4),
          const PaymentMethodWidget(),
          const SizedBox(height: AppDimentions.k20 + 4),
          const SizedBox(height: AppDimentions.k12),
          AppDivider.build(height: 1.5, color: AppColors.kwarningColor100),
          const SizedBox(height: AppDimentions.k12 - 6),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: 'Warning: ',
                  style: TextStyle(
                    color: AppColors.kwarningColor400,
                    fontSize: 13,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  )),
              const TextSpan(
                  text:
                      'Payment method change can only happen on experiation of previous subscription.')
            ]),
            style: TextStyle(
              color: AppColors.kwarningColor300,
              fontSize: 12,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: AppDimentions.k12 - 6),
          AppDivider.build(height: 1.5, color: AppColors.kwarningColor100),
          const SizedBox(height: AppDimentions.k20 + 4),
          AppButton(
            disabled: true,
            buttonType: ButtonType.LONG_BTN,
            flex: false,
            btnText: 'Change payment method',
          ),
          const SizedBox(height: AppDimentions.k20 + 4),
          Container(
              color: AppColors.kbrandWhite,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: AppDimentions.k16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Subscribtions',
                    style: TextStyle(
                      color: Color(0xFF8D8D8D),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: AppDimentions.k16),
                  Expanded(child: AppDivider.build(height: 1.5)),
                ],
              )),
          const SizedBox(height: AppDimentions.k20 + 4),
          Row(
            children: [
              SubCard(
                  primaryColor: getPackageColor(
                      SubType.values.elementAt(currentSubIndex).name)[0],
                  secondaryColor: getPackageColor(
                      SubType.values.elementAt(currentSubIndex).name)[1],
                  isCurrentSub: true,
                  subscribtionTitle:
                      SubType.values.elementAt(currentSubIndex).name),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Go(context, routeName: AllSubsView.routeName).to();
                },
                child: Container(
                  height: 70,
                  width: 70,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: AppColors.kgrayColor50, shape: BoxShape.circle),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ActionBtn(
                          imgUrl: 'card.svg',
                          onPressed: () {
                            Go(context, routeName: AllSubsView.routeName).to();
                          },
                          color: AppColors.kprimaryColor300),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppColors.kprimaryColor300,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: AppDimentions.k20 + 4),
          Container(
            color: AppColors.kbrandWhite,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: AppDimentions.k16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Auto-Renew',
                  style: TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: AppDimentions.k16),
                const Spacer(),
                CupertinoSwitch(
                    activeColor: AppColors.kprimaryColor700,
                    value: true,
                    onChanged: (onChanged) {}),
              ],
            ),
          ),
          const SizedBox(height: AppDimentions.k12),
          Row(
            children: [
              AppButton(
                buttonType: ButtonType.LONG_BTN,
                flex: true,
                btnText: 'Renew',
                onTap: () {
                  DecisionHandler(
                      context: context,
                      tag: Tag.SERVICE_ACTION,
                      appDialogue2Type: AppDialogue2Type.two,
                      title: 'Renew Plan',
                      message:
                          'Are you sure you want to renew your subscription?',
                      callBackTextOne: 'Cancel',
                      callBackTextTwo: 'Proceed',
                      barrierDismissible: true,
                      callBackTwo: () {
                        Go(context).pop();
                        DecisionHandler(
                          context: context,
                          tag: Tag.SERVICE_ACTION,
                          appDialogue2Type: AppDialogue2Type.loading,
                          title: 'Renewing Subscription',
                          message: 'Please wait...',
                        );
                        Timer(const Duration(seconds: 2), () {
                          Go(context).pop();
                          RedirectHandler(
                              context: context,
                              title: 'Plan renewed',
                              message:
                                  'You’ve now sucessfully reenewed Subscription.',
                              tag: Tag.SUCCESS,
                              callBack: () {});
                          Timer(const Duration(seconds: 2), () {
                            Go(context).pop();
                          });
                        });
                      });
                },
              ),
              const SizedBox(width: AppDimentions.k12),
              AppButton(
                buttonType: ButtonType.LONG_BTN,
                flex: true,
                addBorder: true,
                borderColor: AppColors.kprimaryColor700,
                btnColor: AppColors.kbrandWhite,
                btnTextColor: AppColors.kprimaryColor700,
                btnText: 'Cancel',
                onTap: () {
                  DecisionHandler(
                      context: context,
                      tag: Tag.SERVICE_ACTION,
                      appDialogue2Type: AppDialogue2Type.two,
                      title: 'Cancel Plan',
                      message:
                          'Are you sure you want to cancel your subscription?',
                      callBackTextOne: 'Cancel',
                      callBackTextTwo: 'Proceed',
                      barrierDismissible: true,
                      callBackTwo: () {
                        Go(context).pop();
                        DecisionHandler(
                          context: context,
                          tag: Tag.SERVICE_ACTION,
                          appDialogue2Type: AppDialogue2Type.loading,
                          title: 'Cancelling Subscription',
                          message: 'Please wait...',
                        );
                        Timer(const Duration(seconds: 2), () {
                          Go(context).pop();
                          RedirectHandler(
                              context: context,
                              title: 'Subscription Cancelled',
                              message:
                                  'You’ve now sucessfully cancelled Subscription.',
                              tag: Tag.SUCCESS,
                              callBack: () {});
                          Timer(const Duration(seconds: 2), () {
                            Go(context).pop();
                          });
                        });
                      });
                },
              ),
            ],
          ),
          const SizedBox(height: AppDimentions.k20 + 9),
        ]),
      );
}

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(AppDimentions.k12),
      leading: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 2,
              offset: Offset(0, -1),
              spreadRadius: 0,
            )
          ],
        ),
        child: SvgPicture.asset('assets/icons/logos_mastercard.svg'),
      ),
      title: const Text(
        '•••• •••• •••• 4513',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w700,
          height: 0.10,
        ),
      ),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColors.kprimaryColor300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class SubCard extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final bool isCurrentSub;
  final String subscribtionTitle;
  const SubCard({
    super.key,
    required this.primaryColor,
    this.isCurrentSub = false,
    required this.secondaryColor,
    this.subscribtionTitle = 'Basic',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 339,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.18,
              color: isCurrentSub ? primaryColor : AppColors.kgrayColor100),
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 2.35,
            offset: Offset(0, 1.18),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 2.35,
            offset: Offset(0, -1.18),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: AppDimentions.k20 + 4),
          Container(
            constraints: const BoxConstraints(maxWidth: 96, minWidth: 63),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            decoration: ShapeDecoration(
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              subscribtionTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(
            child: Text(
              '\$3',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 48,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Text(
            '\$90.00 / month',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppDimentions.k20 + 9),
          AppDivider.build(width: 202.w),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                    activeColor: isCurrentSub
                        ? primaryColor.withOpacity(0.5)
                        : primaryColor,
                    value: true,
                    onChanged: (onChanged) {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                const Text(
                  'Select 1 country',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF464646),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          AppDivider.build(width: 202.w),
          const SizedBox(height: AppDimentions.k20 + 9),
          GestureDetector(
            onTap: isCurrentSub
                ? () {
                    DecisionHandler(
                        context: context,
                        tag: Tag.SERVICE_ACTION,
                        appDialogue2Type: AppDialogue2Type.two,
                        title: 'Cancel Plan',
                        message:
                            'Are you sure you want to cancel your subscription?',
                        callBackTextOne: 'Cancel',
                        callBackTextTwo: 'Proceed',
                        barrierDismissible: true,
                        callBackTwo: () {
                          Go(context).pop();
                          DecisionHandler(
                            context: context,
                            tag: Tag.SERVICE_ACTION,
                            appDialogue2Type: AppDialogue2Type.loading,
                            title: 'Cancelling Subscription',
                            message: 'Please wait...',
                          );
                          Timer(const Duration(seconds: 2), () {
                            Go(context).pop();
                            RedirectHandler(
                                context: context,
                                title: 'Subscription Cancelled',
                                message:
                                    'You’ve now sucessfully cancelled Subscription.',
                                tag: Tag.SUCCESS,
                                callBack: () {});
                            Timer(const Duration(seconds: 2), () {
                              Go(context).pop();
                            });
                          });
                        });
                  }
                : () {
                    DecisionHandler(
                        context: context,
                        tag: Tag.SERVICE_ACTION,
                        appDialogue2Type: AppDialogue2Type.two,
                        title: 'Subscribe to $subscribtionTitle',
                        message:
                            'You are subscribing to $subscribtionTitle, do you wish to proceed?',
                        callBackTextOne: 'Cancel',
                        callBackTextTwo: 'Proceed',
                        barrierDismissible: true,
                        callBackTwo: () {
                          Go(context).pop();
                          Go(context,
                              routeName: AppWebView.routeName,
                              arguments: MyRouteArguments(arguments: [
                                {
                                  'url':
                                      'https://pub.dev/packages/webview_flutter/example'
                                }
                              ])).to();
                          // DecisionHandler(
                          //   context: context,
                          //   tag: Tag.SERVICE_ACTION,
                          //   appDialogue2Type: AppDialogue2Type.loading,
                          //   title: 'Processing payment',
                          //   message: 'Please wait...',
                          // );
                          // Timer(const Duration(seconds: 2), () {
                          //   Go(context).pop();
                          //   Go(context,
                          //       routeName: AppWebView.routeName,
                          //       arguments: MyRouteArguments(arguments: [
                          //         {'url': 'https://pub.dev/packages/webview_flutter/example'}
                          //       ])).to();
                          //   // RedirectHandler(
                          //   //     context: context,
                          //   //     title: 'Congratulations!',
                          //   //     message:
                          //   //         'You’re now a RecentPost Essential Member!',
                          //   //     tag: Tag.SUCCESS);
                          //   Timer(const Duration(seconds: 2), () {
                          //     Go(context).pop();
                          //     Go(context).pop();
                          //   });
                          // });
                        });
                  },
            child: Container(
              width: 202,
              height: 32,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    isCurrentSub ? 'Cancel Plan' : 'Select Plan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: -0.41,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimentions.k20 + 9),
        ],
      ),
    );
  }
}
