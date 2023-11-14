import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/constants/global_constants.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String HintText;
  final bool obscureText;
  final bool isEnabled;
  final void Function(String)? onChanged;
  final TextFieldType textFieldType;
  final String? labelText;
  final TextInputType? keyboardType;
  final void Function()? onSufficIconClicked;
  final String? Function(String?)? validator;

  const AppTextField({
    Key? key,
    required this.controller,
    this.HintText = 'Enter Text',
    this.obscureText = false,
    this.isEnabled = true,
    this.onChanged,
    this.textFieldType = TextFieldType.TEXT,
    this.labelText = '',
    this.keyboardType,
    this.onSufficIconClicked,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textFieldType == TextFieldType.PASSWORD
        ? SizedBox(
            height: 60,
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: AppColors.kwineColor.withOpacity(0.8)),
                  labelText: labelText,
                  filled: true,
                  hintText: HintText,
                  contentPadding: const EdgeInsets.all(GlobalConstants.k20 + 3),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: AppColors.kwineColor.withOpacity(0.07),
                  suffixIcon: IconButton(
                    onPressed: onSufficIconClicked,
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.kwineColor.withOpacity(0.5),
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(14)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(14)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.kwineColor),
                      borderRadius: BorderRadius.circular(14))),
              obscureText: obscureText,
              enabled: isEnabled,
              onChanged: onChanged,
              cursorColor: AppColors.kwineColor,
            ),
          )
        : textFieldType == TextFieldType.PHONE
            ? const SizedBox(height: 0, width: 0)
            : textFieldType == TextFieldType.OTP
                ? const SizedBox(height: 0, width: 0)
                : SizedBox(
                    height: 60,
                    child: TextFormField(
                      keyboardType: keyboardType,
                      controller: controller,
                      validator: validator,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: AppColors.kwineColor.withOpacity(0.8)),
                          labelText: labelText,
                          filled: true,
                          hintText: HintText,
                          contentPadding:
                              const EdgeInsets.all(GlobalConstants.k20 + 3),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: AppColors.kwineColor.withOpacity(0.07),
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(14)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(14)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.kwineColor),
                              borderRadius: BorderRadius.circular(14))),
                      obscureText: obscureText,
                      enabled: isEnabled,
                      onChanged: onChanged,
                      cursorColor: AppColors.kwineColor,
                    ),
                  );
  }
}
