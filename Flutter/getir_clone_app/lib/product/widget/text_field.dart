import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key, required this.controller, required this.hintText, required this.keyboardType
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        )
      );
  }
}

