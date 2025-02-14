import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.isPassword,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isPassword;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? !showPassword : false,
      style: TextStyle(color: Colors.white60),
      controller: widget.controller,
      decoration: InputDecoration(
        helperStyle: TextStyle(color: Colors.blueAccent),
        // icon: Icon(Icons.person,),
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isPassword
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
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
