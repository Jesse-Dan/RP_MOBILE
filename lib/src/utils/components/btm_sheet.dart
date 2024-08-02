import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';

class BTMSheet {
  List<Widget> widgets = [];
  final BuildContext context;
  final AnimationController? animationController;
  final bool enableDrag = true;
  final bool? showDragHandle;
  final Size? dragHandleSize;
  final Color? dragHandleColor;
  final void Function(DragStartDetails)? onDragStart;
  final void Function(DragEndDetails, {required bool isClosing})? onDragEnd;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;
  final void Function() onClosing;

  BTMSheet(this.context,
      {this.animationController,
      this.showDragHandle,
      this.dragHandleSize,
      this.dragHandleColor,
      this.onDragStart,
      this.onDragEnd,
      this.backgroundColor,
      this.shadowColor,
      this.elevation,
      this.shape,
      this.clipBehavior,
      this.constraints,
      required this.onClosing});

  void init(List<Widget> initialWidgets) {
    widgets.addAll(initialWidgets);
  }

  void addWidget(Widget widget) {
    widgets.add(widget);
  }

  void buildSheet() {
    showBottomSheet(
      context: context,
      builder: (ctx) {
        return BottomSheet(
          backgroundColor: AppColors.kbrandWhite,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDim.buildDimention(AppDim.k20,
                      dimention: 4, operation: '+'),
                ),
              ),
          onClosing: onClosing,
          builder: (BuildContext context) {
            return Column(
              children: widgets,
            );
          },
        );
      },
    );
  }
}
