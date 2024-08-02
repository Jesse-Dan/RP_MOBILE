import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/components/app_button.dart';
import 'package:recenth_posts/src/utils/components/app_text_field.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:flutter/material.dart';

import '../../../../../../logic/models/app/user_model.dart';
import '../../../../../../utils/components/base_form_body.dart';
import '../../../../../../utils/enums/enums.dart';
import '../../../../../../utils/style/app_colors.dart';
import '../../../../../base/base_scaffold.dart';
import '../model/poll_payload.dart';

class Poll extends StatefulWidget {
  const Poll({super.key});

  @override
  State<Poll> createState() => _PollState();
}

class _PollState extends State<Poll> {
  final _pollPayload = PollPayload(
    userId: User.getPresentUser().id,
    state: User.getPresentUser().state,
    city: "User.getPresentUser().city",
    device: "User.getPresentUser().device",
    postType: 'poll',
    options: [],
  );

  final _questionController = TextEditingController();
  final _optionControllers = <TextEditingController>[]; // List of controllers

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kprimaryColor100,
      appBar: BaseAppBar(context),
      body: BaseFormBody.build(
        context,
        formKey: _formKey,
        topChildren: [
          const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDim.k16, vertical: AppDim.k20),
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Create Poll',
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
                    'Fill the fields below to create your poll.',
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
        bottomChildren: [
          AppTextField(
            hintText: 'Enter poll title',
            labelText: 'Poll Title',
            controller: _questionController,
            onChanged: (val) {
              setState(() {
                _pollPayload.pollQuestion = val;
              });
            },
          ),
          const SizedBox(height: AppDim.k12 - 5),
          _buildOptionFields(),
          const SizedBox(height: AppDim.k12 - 5),
          AppButton(
            btnText: 'Add Option',
            flex: true,
            onTap: () => _addOption(),
          ),
          const SizedBox(height: AppDim.k12 - 5),
        ],
      ),
    );
  }

  Widget _buildOptionFields() {
    _optionControllers.clear(); // Clear controllers before rebuild
    for (var i = 0; i < (_pollPayload.options?.length ?? 0); i++) {
      _optionControllers
          .add(TextEditingController(text: _pollPayload.options?[i]));
    }
    return ListView.builder(
        shrinkWrap: true,
        itemCount: (_pollPayload.options?.length ?? 0),
        itemBuilder: (_, i) {
          return AppTextField(
            hintText: 'Enter poll option ${i + 1}...',
            controller: _optionControllers[i],
            onCompleted: (p0) {
              setState(() {
                _pollPayload.options?[i] = p0;
              });
              Logger.log(
                  tag: Tag.DEBUG,
                  message: 'Poller { _pollPayload.options.toString()}');
            },
          );
        });
  }

  void _addOption() {
    setState(() {
      _pollPayload.options?.add('');
      Logger.log(tag: Tag.DEBUG, message: _pollPayload.options.toString());
    });
  }
}
