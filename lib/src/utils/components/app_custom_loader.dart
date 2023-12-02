// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:loading_progress_indicator/loading_progress_indicator.dart';
import 'package:loading_progress_indicator/progress_indicator/ball_spin_fade_loader_progress_indicator.dart';

import '../style/app_colors.dart';

LoadingProgressIndicator AppCustomSpinner(
    {dynamic loaderColor,
    height,
    width,
    double? size,
    shape = BoxShape.circle}) {
  return LoadingProgressIndicator(
    size: (size) ?? 24,
    indicator: BallSpinFadeLoaderProgressIndicator(),
    color: loaderColor ?? AppColors.kwhiteColor,
  );
}

/// [OVERLAY LOAD]
Widget AppLoadingIndicator({Color? color, loaderColor}) => Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? AppColors.kwhiteColor,
        ),
        height: 50,
        width: 50,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AppCustomSpinner(loaderColor: loaderColor),
        ),
      ),
    );
