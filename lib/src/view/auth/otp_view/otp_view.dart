import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

import '../../../utils/constants/global_constants.dart';
import '../../../utils/style/app_colors.dart';

class OtpView extends StatefulWidget {
  static const routeName = '/otp.view';

  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: true,
      body: Stack(
        children: [
          Image.asset('assets/images/TopBg.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 100.h),
              SizedBox(height: (GlobalConstants.k20 + 10).h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Otp Verification',
                  style: TextStyle(
                    color: AppColors.kwineColor,
                    fontSize: 32,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: GlobalConstants.k16.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(children: [
                    const TextSpan(
                        text:
                            'Enter the OTP code we just sentyou on your registered Email/Phone number'),
                    TextSpan(
                      text: '',
                      style: TextStyle(
                        color: AppColors.kpouchBlue.withOpacity(0.5),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.klightBlackColor.withOpacity(0.7),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: (GlobalConstants.k20 + 4).h),
              // Add more widgets as needed for the OTP view
            ],
          ),
        ],
      ),
    );
  }
}
