import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';


class BaseScaffold extends StatefulWidget {
  const BaseScaffold({
      super.key,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.body,
      this.floatingActionButton
      });

  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? AppColors.kWhiteColor,
      body: widget.body,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
