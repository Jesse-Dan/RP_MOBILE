import 'package:flutter/material.dart';

import '../enums/enums.dart';
import '../style/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function(bool)? onChanged;
  final CheckBoxTextPosition textPosition;
  final String? leftText;
  final String? rightText;
  final Color enabledColor;
  final Color disabledColor;
  final Color emptyColor;
  final Color? textColor;

  const AppCheckBox({
    Key? key,
    required this.isChecked,
    required this.onChanged,
    this.textPosition = CheckBoxTextPosition.right,
    this.leftText,
    this.rightText,
    this.enabledColor = Colors.green,
    this.disabledColor = Colors.grey,
    this.emptyColor = Colors.transparent,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (textPosition == CheckBoxTextPosition.left ||
            textPosition == CheckBoxTextPosition.both)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              leftText ?? '',
              style: TextStyle(
                color: textColor ?? AppColors.kpouchBlue,
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        InkWell(
            onTap: onChanged != null ? () => onChanged!(!isChecked) : null,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isChecked ? enabledColor : disabledColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
                color: isChecked ? enabledColor : emptyColor,
              ),
              child: isChecked
                  ? const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    )
                  : null,
            )),
        if (textPosition == CheckBoxTextPosition.right ||
            textPosition == CheckBoxTextPosition.both)
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                rightText ?? '',
                style: TextStyle(
                  color: textColor ?? AppColors.kpouchBlue,
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              )),
      ],
    );
  }
}
