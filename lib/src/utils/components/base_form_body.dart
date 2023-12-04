import 'package:flutter/material.dart';

import '../style/app_dimentions.dart';

class BaseFormBody {
  static build(BuildContext context,
      {required List<Widget> topChildren,
      required List<Widget> bottomChildren,GlobalKey<FormState>? formKey}) {
    List<Widget> items = [];
    items.addAll(topChildren);
    items.add(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: AppDimentions.k16),
        width: 430,
        height: 696,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: bottomChildren,
          ),
        ),
      ),
    );

    return Column(
      children: items,
    );
  }
}
