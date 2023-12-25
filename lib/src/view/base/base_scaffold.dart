// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({
    super.key,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.body,
    this.floatingActionButton,
    this.addBackgroundColor = true,
    this.appBar,
    this.addbodyPadding = false,
    this.addSafeArea = false,
    this.addAppBar,
    this.refreshable = false,
    this.physics,
    this.onRefresh,
    this.defaultBackBtnCallBack,
    this.controller,
    this.floatingActionButtonLocation,
    this.safeAreaConfig = const SafeAreaConfig(),
    this.bottomSheet,
  });

  final Color? backgroundColor;
  final bool addBackgroundColor;
  final PreferredSizeWidget? appBar;
  final bool? addAppBar;

  final bool addbodyPadding;
  final bool addSafeArea;
  final bool refreshable;

  final ScrollPhysics? physics;

  final Widget? bottomNavigationBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Future<void> Function()? onRefresh;
  final void Function()? defaultBackBtnCallBack;
  final ScrollController? controller;
  final SafeAreaConfig safeAreaConfig;
  final Widget? bottomSheet;

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return widget.addSafeArea
        ? SafeAreaConfig(
            left: widget.safeAreaConfig.left,
            right: widget.safeAreaConfig.right,
            top: widget.safeAreaConfig.top,
            bottom: widget.safeAreaConfig.bottom,
            child: _buildBody(),
          )
        : _buildBody();
  }

  Scaffold _buildBody() {
    return Scaffold(
      appBar: (widget.addAppBar ?? false)
          ? (widget.appBar ??
              AppBar(
                leading: IconButton(
                    onPressed: widget.defaultBackBtnCallBack ??
                        () {
                          Go(context).pop();
                        },
                    icon: Image.asset('assets/icons/back_icon.png')),
                backgroundColor: AppColors.kprimaryColor100,
              ))
          : null,
      backgroundColor: widget.backgroundColor ??
          (widget.addBackgroundColor ? AppColors.kwhiteColor : null),
      body: widget.refreshable
          ? RefreshIndicator.adaptive(
              child: _body(), onRefresh: widget.onRefresh ?? () async {})
          : _body(),
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      bottomSheet: widget.bottomSheet,
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
        controller: widget.controller,
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

class SafeAreaConfig extends StatelessWidget {
  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;
  final Widget? child;

  const SafeAreaConfig({
    super.key,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
      child: child ?? const SizedBox(),
    );
  }
}
