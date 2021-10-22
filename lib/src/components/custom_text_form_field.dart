import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.validate,
      required this.label,
      this.keyboardType,
      this.obscureText})
      : super(key: key);

  final TextEditingController controller;
  final Function validate;
  final String label;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      validator: (value) => validate(value),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 20)),
      style: TextStyle(fontSize: 20),
    );
  }
}
