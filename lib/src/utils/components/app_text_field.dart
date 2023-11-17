// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:recenth_posts/src/utils/components/dropdown_button.dart';
import 'package:recenth_posts/src/utils/constants/global_constants.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

class AppTextField extends StatefulWidget {
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
  final void Function()? onTap;
  final List<String> items;
  String? value;
  AppTextField({
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
    this.onTap,
    this.items = const [],
    this.value,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState<T> extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return widget.textFieldType == TextFieldType.PASSWORD
        ? SizedBox(
            // height: 60,
            child: TextFormField(
              style: myTextFieldStyle(),
              keyboardType: TextInputType.visiblePassword,
              controller: widget.controller,
              validator: widget.validator,
              decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: AppColors.kwineColor.withOpacity(0.8)),
                  labelText: widget.labelText,
                  filled: true,
                  hintText: widget.hintText,
                  contentPadding: const EdgeInsets.all(GlobalConstants.k20 + 3),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: AppColors.kwineColor.withOpacity(0.07),
                  suffixIcon: IconButton(
                    onPressed: widget.onSufficIconClicked,
                    icon: Icon(
                      widget.obscureText
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
              obscureText: widget.obscureText,
              enabled: widget.isEnabled,
              onChanged: widget.onChanged,
              cursorColor: AppColors.kwineColor,
            ),
          )
        : widget.textFieldType == TextFieldType.DROPDOWN
            ? Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.kwineColor.withOpacity(0.09),
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: SizedBox(
                              child: Text(
                        widget.controller.text.isEmpty
                            ? 'Country'
                            : widget.controller.text,
                        style: myTextFieldStyle(),
                      ))),
                      SizedBox(
                        width: 100,
                        height: 60,
                        child: appDropdownButton(
                          controller: widget.controller,
                          items: widget.items,
                          value: widget.value,
                          onChanged: (String? val) {
                            if (val != 'Loading...' ||
                                val != 'Error fetching countries') {
                              setState(() {
                                widget.value = val;
                                widget.controller.text = val!;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : widget.textFieldType == TextFieldType.OTP
                ? PinCodeTextField(
                    autofocus: true,
                    controller: widget.controller,
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
                      keyboardType: widget.keyboardType,
                      controller: widget.controller,
                      validator: widget.validator,
                      style: myTextFieldStyle(),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: AppColors.kwineColor.withOpacity(0.8)),
                          labelText: widget.labelText,
                          filled: true,
                          hintText: widget.hintText,
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
                      obscureText: widget.obscureText,
                      enabled: widget.isEnabled,
                      onChanged: widget.onChanged,
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

  TextStyle myTextFieldStyle({color}) {
    return TextStyle(
      color: color ?? AppColors.kwineColor.withOpacity(0.9),
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }
}
