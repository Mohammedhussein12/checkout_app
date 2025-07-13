import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    elevation: 0,
    leading: Center(
      child: SvgPicture.asset(
        'assets/images/arrow_back.svg',
      ),
    ),
    title: Text(
      title ?? '',
      style: Styles.style25,
    ),
    centerTitle: true,
  );
}
