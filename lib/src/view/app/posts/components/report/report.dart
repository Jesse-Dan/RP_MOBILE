// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:recenth_posts/src/logic/services/handler/handlers/redirect_handler.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

import '../../../../../utils/style/app_colors.dart';

class Report extends StatefulWidget {
  static const String routeName = '/post.report';

  Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  ScrollController scrollController = ScrollController();
  final GlobalKey key = GlobalKey();

  int? selectedValueId;
  int? selectedValueId2;
  double stageId = 0;
  double step = 0.333333333;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addAppBar: true,
      appbar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/MainLogo.png',
          width: 116.85,
          height: 46.24,
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                top: AppDimentions.k20, right: AppDimentions.k20),
            child: TextButton(
                style: const ButtonStyle(
                  splashFactory: InkRipple.splashFactory,
                ),
                onPressed: () {
                  Go(context).pop();
                },
                child: Text('Cancel',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: AppColors.kblackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ))),
          )
        ],
        bottom: ReportStageIndicator(stageId: stageId),
      ),
      addbodyPadding: true,
      body: SingleChildScrollView(
        key: key,
        child: stageId == 0
            ? _form1(context)
            : stageId == step
                ? _form2(context)
                : _form3(context),
      ),
    );
  }

  Column _form3(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text.rich(
          TextSpan(
            children: const [
              TextSpan(
                text: 'It sound like you want to make a report for ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'hateful conduct',
                style: TextStyle(
                  color: Color(0xFFD75B6B),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 382,
          child: Text(
            'Abusive behaviour targeting individuals based on their identity is not permitted, including:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: AppDimentions.k16),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 22.3),
            child: Text(
              '• Harassment\n• Cyberbullying\n• Hate Speech\n• Impersonation\n• Threats\n• Sexual Harassment\n• Discrimination \n• Stalking',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: 382,
          child: Text(
            'Is that correct?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0.08,
            ),
          ),
        ),
        const SizedBox(height: 32),
        AppButton(
          disabled: selectedValueId == null,
          flex: false,
          buttonType: ButtonType.LONG_BTN,
          btnText: 'Yes, continue report',
          onTap: () {
            if (stageId < 1.0) {
              setState(() {
                stageId += step;
              });
              RedirectHandler(
                  context: context,
                  title: 'Report successfully submitted',
                  tag: Tag.SUCCESS,
                  message: 'Please wait...\nYou will be directed to the post.',
                  callBack: () {});
              Timer(const Duration(seconds: 2), () {
                Go(context).pop();
                Go(context).pop();
              });
            }
          },
        ),
        const SizedBox(height: AppDimentions.k16),
        AppButton(
          btnColor: AppColors.kbrandWhite,
          borderColor: AppColors.kprimaryColor600,
          btnTextColor: AppColors.kprimaryColor600,
          disabled: selectedValueId == null,
          flex: false,
          buttonType: ButtonType.LONG_BTN,
          addBorder: true,
          btnText: 'No, select different reason',
          onTap: () {
            if (stageId < 1.0) {
              setState(() {
                stageId -= step;
                stageId -= step;
                selectedValueId = null;
                selectedValueId2 = null;
              });
            }
          },
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  Column _form2(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        SizedBox(
          width: 382,
          child: Text('Hate',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontSize: 24)),
        ),
        const SizedBox(height: 24),
        ListView.builder(
            controller: scrollController,
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (ctx, i) {
              return _reportCard(
                i,
                groupValue: selectedValueId2,
                onChanged: (value) {
                  selectedValueId2 = value;
                  setState(() {});
                },
              );
            }),
        const SizedBox(height: 80),
        AppButton(
          disabled: selectedValueId2 == null,
          flex: false,
          buttonType: ButtonType.LONG_BTN,
          btnText: 'Continue',
          onTap: () {
            if (stageId < 1.0) {
              setState(() {
                stageId += step;
              });
              Scrollable.ensureVisible(key.currentContext!,
                  curve: Curves.easeInBack,
                  duration: const Duration(milliseconds: 300));
            }
          },
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  Column _form1(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        SizedBox(
          width: 382,
          child: Text('What type of problem are you reporting?',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontSize: 24)),
        ),
        const SizedBox(height: 24),
        ListView.builder(
            controller: scrollController,
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (ctx, i) {
              return _reportCard(
                i,
                groupValue: selectedValueId,
                onChanged: (value) {
                  selectedValueId = value;
                  setState(() {});
                },
              );
            }),
        const SizedBox(height: 80),
        AppButton(
          disabled: selectedValueId == null,
          flex: false,
          buttonType: ButtonType.LONG_BTN,
          btnText: 'Continue',
          onTap: () {
            if (stageId < 1.0) {
              setState(() {
                stageId += step;
              });
              Scrollable.ensureVisible(key.currentContext!,
                  curve: Curves.easeIn, duration: const Duration(seconds: 1));
            }
          },
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  _reportCard(i,
      {required int? groupValue, required void Function(int?)? onChanged}) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(vertical: AppDimentions.k12),
      width: 382,
      height: 146,
      decoration: BoxDecoration(color: AppColors.kbrandWhite),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Hate [${i + 1}]',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Radio<int>(
                  activeColor: AppColors.kprimaryColor700,
                  value: i,
                  groupValue: groupValue,
                  onChanged: onChanged),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 340,
              child: Text(
                'Offensive language, Discriminatory stereotypes, Dehumanizing content, Promotion of fear or discrimination, Offensive references, and Symbols or logos conveying hatred',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kgrayColor800),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReportStageIndicator extends StatelessWidget
    implements PreferredSizeWidget {
  final double stageId;
  const ReportStageIndicator({Key? key, required this.stageId})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppDimentions.k20),
        child: LinearPercentIndicator(
          barRadius: const Radius.circular(4),
          lineHeight: 8.0,
          percent: stageId,
          progressColor: AppColors.kprimaryColor700,
        ),
      ),
    ));
  }
}
