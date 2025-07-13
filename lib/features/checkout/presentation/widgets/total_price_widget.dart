import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  final String title, value;
  const TotalPrice({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style24,
        ),
        Spacer(),
        Text(
          '\$$value',
          style: Styles.style24,
        ),
      ],
    );
  }
}
