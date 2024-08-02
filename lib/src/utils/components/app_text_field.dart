// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:recenth_posts/src/utils/components/dropdown_button.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../style/app_dimentions.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isEnabled;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final TextFieldType textFieldType;
  final String? labelText;
  final TextInputType? keyboardType;
  final void Function()? onSufficIconClicked;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final List<String> items;
  final Widget? prefix;
  final bool readOnly;
  final double? height;
  String? value;
  AppTextField(
      {Key? key,
      required this.controller,
      this.hintText = 'Enter Text',
      this.obscureText = false,
      this.isEnabled = true,
      this.onChanged,
      this.textFieldType = TextFieldType.TEXT,
      this.labelText,
      this.keyboardType,
      this.onSufficIconClicked,
      this.validator,
      this.onTap,
      this.items = const [],
      this.value,
      this.prefix,
      this.readOnly = false,
      this.onCompleted,
      this.height})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState<T> extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppDim.k12),
          Visibility(
            visible: widget.labelText != null,
            child: SizedBox(
              width: 288,
              child: Text(
                widget.labelText ?? '',
                style: myTextFieldLabelStyle(context),
              ),
            ),
          ),
          Visibility(
              visible: widget.labelText != null,
              child: const SizedBox(height: AppDim.k12)),
          SizedBox(
            height: widget.height ?? 56,
            child: widget.textFieldType == TextFieldType.PASSWORD
                ? SizedBox(
                    // height: 60,
                    child: TextFormField(
                      style: myTextFieldStyle(context),
                      keyboardType: TextInputType.visiblePassword,
                      controller: widget.controller,
                      validator: widget.validator,
                      decoration: InputDecoration(
                        labelStyle: myTextFieldHintStyle(context),
                        labelText: widget.hintText,
                        hintText: widget.hintText,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        suffixIcon: IconButton(
                          onPressed: widget.onSufficIconClicked,
                          icon: Icon(
                            widget.obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            opticalSize: 18,
                            color: AppColors.kgrayColor500,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.kgrayColor200),
                            borderRadius: BorderRadius.circular(4)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.kgrayColor200),
                            borderRadius: BorderRadius.circular(4)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.kgrayColor200),
                            borderRadius: BorderRadius.circular(4)),
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      obscureText: widget.obscureText,
                      enabled: widget.isEnabled,
                      onChanged: widget.onChanged,
                      cursorColor: AppColors.kwineColor,
                    ),
                  )
                : widget.textFieldType == TextFieldType.DROPDOWN
                    ? Container(
                        height: widget.height ?? 70,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.kbrandWhite,
                            border: Border.all(color: AppColors.kgrayColor200),
                            borderRadius: BorderRadius.circular(4)),
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
                                    ? widget.hintText
                                    : widget.controller.text,
                                style: !widget.items
                                        .contains(widget.controller.text)
                                    ? myTextFieldHintStyle(context)
                                    : myTextFieldStyle(context),
                              ))),
                              SizedBox(
                                width: 100,
                                height: widget.height ?? 60,
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
                            maxLength: 4,
                            hasError: false,
                            maskCharacter: "😎",
                            onTextChanged: widget.onChanged,
                            onDone: widget.onCompleted,
                            pinBoxWidth: 56,
                            pinBoxHeight: 70,
                            hasUnderline: false,
                            wrapAlignment: WrapAlignment.spaceBetween,
                            pinBoxDecoration: myPinBoxDecoration,
                            pinTextStyle: TextStyle(
                              color: AppColors.kprimaryColor700.withOpacity(.7),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                            pinTextAnimatedSwitcherTransition:
                                ProvidedPinBoxTextAnimation.scalingTransition,
                            pinBoxColor:
                                AppColors.kprimaryColor700.withOpacity(0.09),
                            pinTextAnimatedSwitcherDuration:
                                const Duration(milliseconds: 400),
                            keyboardType: TextInputType.number,
                          )
                        : TextFormField(
                            onTap: widget.onTap,
                            readOnly: widget.readOnly,
                            keyboardType: widget.keyboardType,
                            controller: widget.controller,
                            validator: widget.validator,
                            style: myTextFieldStyle(context),
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: myTextFieldHintStyle(context),
                              labelText: widget.hintText,
                              hintText: widget.hintText,
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      top: AppDim.k16,
                                      bottom: AppDim.k16,
                                      left: 10),
                                  child: widget.prefix),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.kgrayColor200),
                                  borderRadius: BorderRadius.circular(4)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.kgrayColor200),
                                  borderRadius: BorderRadius.circular(4)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.kgrayColor200),
                                  borderRadius: BorderRadius.circular(4)),
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            obscureText: widget.obscureText,
                            enabled: widget.isEnabled,
                            onChanged: widget.onChanged,
                            cursorColor: AppColors.kwineColor,
                          ),
          )
        ],
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
}

TextStyle myTextFieldStyle(context, {color}) {
  return Theme.of(context).textTheme.titleSmall!.copyWith(
        color: AppColors.kgrayColor900,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
}

TextStyle myTextFieldHintStyle(context, {color}) {
  return Theme.of(context).textTheme.titleSmall!.copyWith(
        color: AppColors.kgrayColor300,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
}

TextStyle myTextFieldLabelStyle(context, {color}) {
  return Theme.of(context).textTheme.titleSmall!.copyWith(
        fontFamily: 'DM Sans',
        color: AppColors.kgrayColor800,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
}
