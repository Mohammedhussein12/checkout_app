import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xffD9D9D9),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xff34A853),
        child: Icon(
          Icons.check,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
