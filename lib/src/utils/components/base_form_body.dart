import 'package:flutter/material.dart';

import '../style/app_dimentions.dart';

class BaseFormBody {
  static build(BuildContext context,
      {required List<Widget> topChildren,
      required List<Widget> bottomChildren,
      GlobalKey<FormState>? formKey}) {
    List<Widget> items = [];
    items.addAll(topChildren);
    items.add(
      Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDim.k16, vertical: AppDim.k16),
        width: double.infinity,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
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

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: items,
      ),
    );
  }
}
