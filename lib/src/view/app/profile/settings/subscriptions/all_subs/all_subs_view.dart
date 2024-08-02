// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/components/app_simple_app_bar.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:recenth_posts/src/utils/style/app_dimentions.dart';
import 'package:recenth_posts/src/view/app/profile/settings/subscriptions/subscriptions.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

class AllSubsView extends StatefulWidget {
  static const String routeName = '/profile.view.settings.subs.all.subs';
  const AllSubsView({super.key});

  @override
  State<AllSubsView> createState() => _AllSubsViewState();
}

class _AllSubsViewState extends State<AllSubsView> {
  @override
  Widget build(BuildContext context) {
    List<Text> titles = List.generate(
      SubType.values.length,
      (index) => Text(
        '${getDuration(SubType.values.elementAt(index).name)} ${SubType.values.elementAt(index).name} Packages',
        style: const TextStyle(
          color: Color(0xFF232323),
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
    return BaseScaffold(
      addAppBar: true,
      appBar: AppSimpleAppBar(context, title: 'Subscribtions'),
      addbodyPadding: true,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            SubType.values.length,
            (index) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  '${getDuration(SubType.values.elementAt(index).name)} ${SubType.values.elementAt(index).name} Packages',
                  style: const TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 339,
                  child: ListView.builder(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppDim.k16),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, args) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDim.k12),
                          child: SubCard(
                              primaryColor: getPackageColor(
                                  SubType.values.elementAt(index).name)[0],
                              secondaryColor: getPackageColor(
                                  SubType.values.elementAt(index).name)[1],
                              subscribtionTitle:
                                  SubType.values.elementAt(index).name),
                        );
                      }),
                ),
                const SizedBox(height: 30),
              ],
            ),
          )),
    );
  }
}

String getDuration(String packageName) {
  switch (packageName) {
    case 'Basic':
      return '24-hours';
    case 'Essential':
      return '3-days';
    case 'Flex':
      return '7-days';
    case 'Pro':
      return '7-days';
    case 'Premium':
      return '14-days';
    case 'Gold':
      return '30-days';
    case 'Platinum':
      return '60-days';
    case 'Ultimate':
      return '90-days';
    case 'Diamond':
      return '180-days';
    case 'Executive':
      return '1 Year';

    default:
      return 'Package Duration Unverified';
  }
}

List<Color> getPackageColor(String packageName) {
  switch (packageName) {
    case 'Basic':
      return [AppColors.kgrayColor100, AppColors.kgrayColor700];
    case 'Essential':
      return [AppColors.kprimaryColor300, AppColors.kprimaryColor700];
    case 'Flex':
      return [AppColors('#D7C3B1'), AppColors('#826F5E')];
    case 'Pro':
      return [AppColors('#D7C3B1'), AppColors('#826F5E')];
    case 'Premium':
      return [AppColors('#525266'), AppColors.kbrandWhite];
    // case 'Premium':
    //   return [AppColors('#826F5E'), AppColors.kbrandWhite];
    case 'Gold':
      return [AppColors('#D99101'), AppColors.kbrandWhite];
    case 'Platinum':
      return [AppColors('#92A1CF'), AppColors.kbrandWhite];
    case 'Ultimate':
      return [AppColors.kgrayColor600, AppColors.kbrandWhite];
    case 'Diamond':
      return [AppColors.ksecondaryColor300, AppColors.kbrandWhite];
    case 'Executive':
      return [AppColors.kprimaryColor500, AppColors.kbrandWhite];
    default:
      return [AppColors('#826F5E'), AppColors('#D7C3B1')];
  }
}
