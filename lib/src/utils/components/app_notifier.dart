import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:recenth_posts/src/logic/services/logger/logger.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';

import '../style/app_colors.dart';
import '../style/app_dimentions.dart';

class AppNotifier {
  static notify(context,
          {required AppNotifierType appNotifierType,
          String title = '',
          String message = ''}) =>
      InAppNotification.show(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppDimentions.k16),
          width: 382,
          height: 73,
          decoration: ShapeDecoration(
              color: appNotifierType == AppNotifierType.SUCCESS
                  ? AppColors.ksecondaryColor50
                  : AppColors.kerrorColor50,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1,
                    color: appNotifierType == AppNotifierType.SUCCESS
                        ? AppColors.ksecondaryColor700
                        : AppColors.kerrorColor700),
                borderRadius: BorderRadius.circular(8),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: appNotifierType == AppNotifierType.SUCCESS
                      ? AppColors.ksecondaryColor700
                      : AppColors.kerrorColor700,
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 202,
                child: Text(
                  message,
                  style: TextStyle(
                    color: AppColors.kgrayColor600,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        context: context,
        onTap: () => Logger(tag: Tag.SERVICE_ACTION, message: 'Notified'),
      );
}
