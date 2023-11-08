import 'package:flutter/material.dart';
import 'package:loading_progress_indicator/loading_progress_indicator.dart';
import 'package:loading_progress_indicator/progress_indicator/ball_spin_fade_loader_progress_indicator.dart';

import '../style/app_colors.dart';

LoadingProgressIndicator CustomSpinner(
    {dynamic loaderColor,
    height,
    width,
    double? size,
    shape = BoxShape.circle}) {
  return LoadingProgressIndicator(
    size: (size) ?? 24,
    indicator: BallSpinFadeLoaderProgressIndicator(),
    color: loaderColor ?? AppColors.kblackColor,
  );
}

/// [OVERLAY LOAD]
Widget AppLoadingIndicator({Color? color}) => Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? AppColors.kblackColor,
        ),
        height: 50,
        width: 50,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomSpinner(),
        ),
      ),
    );
