import 'package:flutter/material.dart';

class ExtractedWidget extends StatelessWidget {
  const ExtractedWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white60),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
