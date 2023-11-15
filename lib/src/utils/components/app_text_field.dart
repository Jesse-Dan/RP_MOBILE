import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:recenth_posts/src/utils/constants/global_constants.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
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
    this.hintText = 'Enter Text',
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
            // height: 60,
            child: TextFormField(
              style: myTextFieldStyle(),
              keyboardType: TextInputType.visiblePassword,
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: AppColors.kwineColor.withOpacity(0.8)),
                  labelText: labelText,
                  filled: true,
                  hintText: hintText,
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
                ? PinCodeTextField(
                    autofocus: true,
                    controller: controller,
                    hideCharacter: false,
                    maxLength: 5,
                    hasError: false,
                    maskCharacter: "😎",
                    onTextChanged: (text) {},
                    onDone: (text) {},
                    pinBoxWidth: 56,
                    pinBoxHeight: 70,
                    hasUnderline: false,
                    wrapAlignment: WrapAlignment.spaceBetween,
                    pinBoxDecoration: myPinBoxDecoration,
                    pinTextStyle: TextStyle(
                      color: AppColors.kwineColor.withOpacity(.7),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    pinBoxColor: AppColors.kwineColor.withOpacity(0.09),
                    pinTextAnimatedSwitcherDuration:
                        const Duration(milliseconds: 400),
                    keyboardType: TextInputType.number,
                  )
                : SizedBox(
                    // height: 60,
                    child: TextFormField(
                      keyboardType: keyboardType,
                      controller: controller,
                      validator: validator,
                      style: myTextFieldStyle(),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: AppColors.kwineColor.withOpacity(0.8)),
                          labelText: labelText,
                          filled: true,
                          hintText: hintText,
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

  BoxDecoration myPinBoxDecoration(
    Color fillColor,
    Color borderColor, {
    double? borderWidth,
    double? radius,
  }) {
    return BoxDecoration(
      color: AppColors.kwineColor.withOpacity(0.2),
      borderRadius:
          BorderRadius.circular(12.0), // Default radius if not provided
    );
  }

  TextStyle myTextFieldStyle() {
    return TextStyle(
      color: AppColors.kwineColor.withOpacity(0.9),
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }
}
