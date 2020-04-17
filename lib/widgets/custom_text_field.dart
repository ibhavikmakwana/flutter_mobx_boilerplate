import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.hintText,
    this.focusNode,
    this.controller,
    this.errorText,
    this.onSubmitted,
    this.onChanged,
    this.obscureText = false,
    this.textInputAction,
  }) : super(key: key);

  final String hintText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final String errorText;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
      ),
    );
  }
}
