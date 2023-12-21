// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../../../../utils/components/app_simple_app_bar.dart';
import '../../../../base/base_scaffold.dart';

class PrivacyVisibilityView extends StatefulWidget {
  static const String routeName = '/profile.view.settings.privacy.visibility';

  const PrivacyVisibilityView({
    super.key,
  });

  @override
  State<PrivacyVisibilityView> createState() => _PrivacyVisibilityViewState();
}

class _PrivacyVisibilityViewState extends State<PrivacyVisibilityView> {
  ScrollController scrollController = ScrollController();
  int? _selectedValue = 1;
  @override
  Widget build(BuildContext context) => BaseScaffold(
        addAppBar: true,
        addSafeArea: false,
        addbodyPadding: true,
        appbar: AppSimpleAppBar(context, title: 'Visibility'),
        physics: const BouncingScrollPhysics(),
        backgroundColor: AppColors.kbrandWhite,
        body: Column(
          children: [
            const Text(
              'Choose who can see your profile',
              style: TextStyle(
                color: Color(0xFF232323),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            RadioListTile<int>(
              activeColor: AppColors.kprimaryColor700,
              title: const Text(
                'Everybody',
                style: TextStyle(
                  color: Color(0xFF464646),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            RadioListTile<int>(
              activeColor: AppColors.kprimaryColor700,
              title: const Text(
                'Only Favourite',
                style: TextStyle(
                  color: Color(0xFF464646),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              value: 2,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            RadioListTile<int>(
              activeColor: AppColors.kprimaryColor700,
              title: const Text(
                'Nobody',
                style: TextStyle(
                  color: Color(0xFF464646),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              value: 3,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          ],
        ),
      );
}
