// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/components/profile_icon.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

import '../../../base/base_scaffold.dart';

class AddChatFromFavView extends StatefulWidget {
  static const String routeName = '/chats.details.view';

  const AddChatFromFavView({
    super.key,
  });

  @override
  State<AddChatFromFavView> createState() => _AddChatFromFavViewState();
}

class _AddChatFromFavViewState extends State<AddChatFromFavView> {
  final scrollCtl = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: false,
      addAppBar: true,
      appbar: AppBar(
        leading: IconButton(
          onPressed: () {
            Go(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfileIcon(
              margin: EdgeInsets.all(0),
            ),
            const SizedBox(width: 26),
            Text(
              'Annette Black',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0B0B0B),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0.08,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      physics: const BouncingScrollPhysics(),
      backgroundColor: AppColors.kbrandWhite,
    );
  }
}
