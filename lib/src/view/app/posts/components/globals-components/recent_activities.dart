// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:recenth_posts/src/utils/components/app_custom_loader.dart';
import 'package:recenth_posts/src/utils/components/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/style/app_colors.dart';
import '../post/bloc/get_post_bloc_bloc.dart';
import '../post/bloc/get_post_bloc_state.dart';

class RecentActivities extends StatefulWidget {
  const RecentActivities({
    super.key,
  });

  @override
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  var _value;
  List<String> recentActivities = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostBlocBloc, GetPostBlocState>(
        builder: (context, state) {
      if (state is GetPostLoadingState) {
        return AppLoadingIndicator(size: 8);
      } else if (state is GetPostSucessfulState) {
        recentActivities.clear();
        state.response.data?.forEach((element) {
          if (element.subject != null && element.subject != '') {
            recentActivities.add(element.subject!);
          }
        });
        return SizedBox(
          height: 32,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentActivities.length,
              shrinkWrap: true,
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: () {
                  setState(() {
                    _value = recentActivities[i];
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 12,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: ShapeDecoration(
                    color: _value == recentActivities[i]
                        ? AppColors.kprimaryColor600
                        : AppColors.kbrandWhite,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: _value == recentActivities[i] ? 2 : 1,
                          color: _value == recentActivities[i]
                              ? AppColors.kbrandWhite
                              : const Color(0xFFEFEFEF)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    recentActivities[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _value == recentActivities[i]
                          ? AppColors.kbrandWhite
                          : const Color(0xFF464646),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        AppNotifier.notifyAction(context, message: 'Error on post');
        return const SizedBox(
          height: 50,
          // width: ,
        );
      }
    });
  }
}
