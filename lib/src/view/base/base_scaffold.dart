import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold(
      {super.key,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.body,
      this.floatingActionButton,
      this.addBackgroundColor = true,
      this.appbar,
      this.addbodyPadding = false,
      this.addSafeArea = false,
      this.addAppBar});

  final Color? backgroundColor;
  final bool addBackgroundColor;
  final PreferredSizeWidget? appbar;
  final bool? addAppBar;

  final bool addbodyPadding;
  final bool addSafeArea;

  final Widget? bottomNavigationBar;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return widget.addSafeArea
        ? SafeArea(
            child: _buildBody(),
          )
        : _buildBody();
  }

  Scaffold _buildBody() {
    return Scaffold(
      appBar: (widget.addAppBar ?? false) ? (widget.appbar ?? AppBar()) : null,
      backgroundColor: widget.backgroundColor ??
          (widget.addBackgroundColor ? AppColors.kWhiteColor : null),
      body: SingleChildScrollView(
          child: widget.addbodyPadding
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: widget.body)
              : widget.body),
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
