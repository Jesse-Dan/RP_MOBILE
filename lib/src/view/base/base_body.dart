import 'package:flutter/material.dart';

import '../../utils/style/app_dimentions.dart';

class BaseBody extends StatelessWidget {
  const BaseBody({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 84 - 90,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDim.k16),
        child: Padding(
            padding: const EdgeInsets.only(bottom: 70.0), child: _child),
      ),
    );
  }
}
