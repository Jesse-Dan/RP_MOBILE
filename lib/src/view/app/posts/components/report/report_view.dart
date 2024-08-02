// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:recenth_posts/src/logic/services/handler/handlers/loading_handler.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/components/app_notifier.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:recenth_posts/src/view/app/posts/components/post/model/post_model.dart';
import 'package:recenth_posts/src/view/app/posts/components/report/bloc/report_state.dart';
import 'package:recenth_posts/src/view/app/posts/components/report/model/report_payload.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_system/go/go.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../../logic/models/app/user_model.dart';
import '../../../../../utils/style/app_colors.dart';
import 'bloc/report_bloc.dart';
import 'bloc/report_event.dart';

class Report extends StatefulWidget {
  final Post post;
  static const String routeName = '/post.report';

  const Report({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  ScrollController scrollController = ScrollController();
  final GlobalKey key = GlobalKey();

  late String reportTitle;
  late String reportSummary;

  int? selectedValueId;
  int? selectedValueId2;
  double stageId = 0;
  double step = 0.333333333;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addAppBar: true,
      appBar: AppBar(
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
            padding: const EdgeInsets.only(top: AppDim.k20, right: AppDim.k20),
            child: TextButton(
                style: const ButtonStyle(
                  splashFactory: InkRipple.splashFactory,
                ),
                onPressed: () {
                  Go(context).pop();
                },
                child: Text('Cancel',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kblackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ))),
          )
        ],
        bottom: ReportStageIndicator(stageId: stageId),
      ),
      addbodyPadding: true,
      body: BlocListener<ReportBloc, ReportState>(
        listener: (context, state) {
          if (state is LoadingReportState) {
            LoadingHandler(context: context);
          }
          if (state is ErrorReportState) {
            Go(context).pop();
            AppNotifier.notifyAction(
              context,
              message: state.errorMessage,
            );
          }
          if (state is InReportState) {
            Go(context).pop();
            AppNotifier.notifyAction(
              context,
              message: state.genericResponse.message,
            );
          }
        },
        child: SingleChildScrollView(
          key: key,
          child: stageId == 0
              ? _form1(context)
              : stageId == step
                  ? _form2(context)
                  : _form3(context),
        ),
      ),
    );
  }

  Column _form3(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Text.rich(
          TextSpan(
            children: [
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
                text: reportTitle,
                style: TextStyle(
                  color: AppColors.kprimaryColor700,
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
              fontSize: 14,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: AppDim.k16),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 22.3),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: Reportable.reportables.length,
                itemBuilder: (context, i) {
                  return Text(
                    '• ${Reportable.reportables[i].title}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }),
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
              context.read<ReportBloc>().add(ReportActionEvent(ReportPayload(
                  userId: User.getPresentUser().id!,
                  refId: widget.post.id!,
                  refName: widget.post.postType!,
                  reportType: reportTitle,
                  reportSummary: reportSummary,
                  reportedUserId: widget.post.user!.id!)));
            }
          },
        ),
        const SizedBox(height: AppDim.k16),
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
              Logger.log(
                  tag: Tag.DEBUG,
                  message: 'Title: $reportTitle, Summary: $reportSummary');
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
    print(Reportable.reportables
        .where((element) => element.title == reportTitle)
        .firstOrNull!
        .options
        .toList());
    return Column(
      children: [
        const SizedBox(height: 24),
        SizedBox(
          width: 382,
          child: Text(reportTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 24)),
        ),
        const SizedBox(height: 24),
        ListView.builder(
            controller: scrollController,
            itemCount: Reportable.reportables
                .where((element) => element.title == reportTitle)
                .firstOrNull!
                .options
                .toList()
                .length,
            shrinkWrap: true,
            itemBuilder: (ctx, i) {
              return _reportCard2(i, groupValue: selectedValueId2,
                  onChanged: (value) {
                reportSummary = Reportable.reportables
                    .where((element) => element.title == reportTitle)
                    .firstOrNull!
                    .options[i];

                selectedValueId2 = value;
                setState(() {});
              },
                  option: Reportable.reportables
                      .where((element) => element.title == reportTitle)
                      .firstOrNull!
                      .options
                      .toList()[i]);
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
                  .headlineMedium!
                  .copyWith(fontSize: 24)),
        ),
        const SizedBox(height: 24),
        ListView.builder(
            controller: scrollController,
            itemCount: Reportable.reportables.length,
            shrinkWrap: true,
            itemBuilder: (ctx, i) {
              return _reportCard(i, groupValue: selectedValueId,
                  onChanged: (value) {
                reportTitle = Reportable.reportables[i].title;
                setState(() {
                  selectedValueId = value;
                });
              },
                  reportable: Reportable.reportables[i].title,
                  options: Reportable.reportables[i].options);
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

  _reportCard(int i,
      {required int? groupValue,
      required void Function(int?)? onChanged,
      required String reportable,
      required List<String> options}) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.kbrandWhite),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  reportable,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
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
              child: Text(
                options.isEmpty
                    ? ''
                    : options
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', ''),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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

  _reportCard2(int i,
      {required int? groupValue,
      required void Function(int?)? onChanged,
      required String option}) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.kbrandWhite),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                child: Text(
                  option,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kgrayColor800),
                ),
              )),
              Radio<int>(
                  activeColor: AppColors.kgrayColor800,
                  value: i,
                  groupValue: groupValue,
                  onChanged: onChanged),
            ],
          ),
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
        padding: const EdgeInsets.only(bottom: AppDim.k20),
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

class Reportable {
  final String title;
  final List<String> options;

  Reportable({required this.title, required this.options});

  static List<Reportable> reportables = [
    Reportable(title: 'Hate', options: [
      "Hate speech",
      "Hate symbols",
      "Hate groups",
      "Racial discrimination",
      "Religious intolerance"
    ]),
    Reportable(title: 'Violence', options: [
      "Violent threats",
      "Glorification of violence",
      "Physical harm",
      "Sexual violence",
      "Domestic abuse"
    ]),
    Reportable(title: 'Harassment', options: [
      "Bullying",
      "Stalking",
      "Unwanted sexual advances",
      "Cyberbullying",
      "Sexual harassment"
    ]),
    Reportable(title: 'False Information', options: [
      "Misleading content",
      "Fake news",
      "Misinformation",
      "Disinformation",
      "Conspiracy theories"
    ]),
    Reportable(title: 'Impersonation', options: [
      "Fake accounts",
      "Identity theft",
      "Fake profiles",
      "Catfishing",
      "Pretending to be someone else"
    ]),
    Reportable(title: 'Privacy Violation', options: [
      "Posting private information",
      "Unauthorized sharing of personal data",
      "Invasion of privacy",
      "Stalking",
      "Harvesting personal information"
    ]),
    Reportable(title: 'Intellectual Property Violation', options: [
      "Copyright infringement",
      "Trademark infringement",
      "Plagiarism",
      "Counterfeit goods",
      "Unauthorized use of intellectual property"
    ]),
    Reportable(title: 'Spam', options: [
      "Unsolicited messages",
      "Phishing",
      "Scams",
      "Fraudulent schemes",
      "Clickbait"
    ]),
    Reportable(title: 'Self-Harm', options: [
      "Suicide threats",
      "Promotion of self-harm",
      "Encouragement of self-injury",
      "Depression support",
      "Mental health discussions"
    ])
  ];
}
