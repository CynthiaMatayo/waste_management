import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BodyText extends StatelessWidget {
  String text;
  BodyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w400),
    );
  }
}
