// ignore_for_file: sort_child_properties_last

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
      this.addAppBar,
      this.refreshable = false,
      this.physics,
      this.onRefresh,});

  final Color? backgroundColor;
  final bool addBackgroundColor;
  final PreferredSizeWidget? appbar;
  final bool? addAppBar;

  final bool addbodyPadding;
  final bool addSafeArea;
  final bool refreshable;

  final ScrollPhysics? physics;

  final Widget? bottomNavigationBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Future<void> Function()? onRefresh;

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
      body: widget.refreshable
          ? RefreshIndicator.adaptive(
              child: _body(), onRefresh: widget.onRefresh ?? () async {})
          : _body(),
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
        physics: widget.physics ?? const BouncingScrollPhysics(),
        child: widget.addbodyPadding
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _wBody())
            : _wBody());
  }

  _wBody() {
    return (widget.body);
  }
}
