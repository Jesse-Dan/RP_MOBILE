import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class AppRadioTile extends StatefulWidget {
  final int value;
  final String title;
  final int groupValue;
  final ValueChanged<int> onChanged;
  final Color? selectedColor;
  final double borderRadius;
  final String? prefixString;

  const AppRadioTile({
    Key? key,
    required this.value,
    required this.title,
    required this.groupValue,
    required this.onChanged,
    this.selectedColor,
    this.borderRadius = 8.0,
    this.prefixString = '',
  }) : super(key: key);

  @override
  State<AppRadioTile> createState() => _AppRadioTileState();
}

class _AppRadioTileState extends State<AppRadioTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.value == widget.groupValue
            ? (widget.selectedColor ?? AppColors.kprimaryColor300)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: ListTile(
        title: Text(
            widget.value == widget.groupValue
                ? '${widget.prefixString}  ${widget.title}'
                : widget.title,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: widget.value == widget.groupValue ? 20 : 16,
                  color: widget.value == widget.groupValue
                      ? AppColors.kprimaryColor800
                      : null,
                  fontWeight: widget.value == widget.groupValue
                      ? FontWeight.w800
                      : FontWeight.w600,
                )),
        onTap: () => widget.onChanged(widget.value),
      ),
    );
  }
}
