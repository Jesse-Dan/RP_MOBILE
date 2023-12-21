import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/components/app_simple_app_bar.dart';
import 'package:recenth_posts/src/utils/enums/enums.dart';
import 'package:recenth_posts/src/view/app/profile/settings/subscriptions/subscriptions.dart';
import 'package:recenth_posts/src/view/base/base_scaffold.dart';

class AllSubsView extends StatelessWidget {
  static const String routeName = '/profile.view.settings.subs.all.subs';
  const AllSubsView({super.key});

  String getDuration(String packageName) {
    switch (packageName) {
      case 'Basic':
        return '24-hours';
      case 'Essential':
        return '3-days';
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
      appbar: AppSimpleAppBar(context, title: 'Subscribtions'),
      addbodyPadding: true,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            SubType.values.length,
            (index) => Column(
              children: [
                Text(
                  '${getDuration(SubType.values.elementAt(index).name)} ${SubType.values.elementAt(index).name} Packages',
                  style: const TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, args) {
                      return const  SubCard();
                    })
              ],
            ),
          )),
    );
  }
}
