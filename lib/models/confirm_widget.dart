import 'package:flutter/material.dart';

class ConfirmWidget extends StatefulWidget {
  const ConfirmWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.isConfirm,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isConfirm;

  @override
  State<ConfirmWidget> createState() => _ConfirmWidgetState();
}

class _ConfirmWidgetState extends State<ConfirmWidget> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isConfirm ? !showPassword : false,
      style: TextStyle(color: Colors.white60),
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isConfirm
            ? showPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.visibility_off,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.visibility,
                    ),
                  )
            : null,
        hintText: "Confirm Password",
        hintStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
      ),
    );
  }
}
