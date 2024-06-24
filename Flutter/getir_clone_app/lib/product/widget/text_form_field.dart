import 'package:flutter/material.dart';

class TextFormFieldIsNotEmpty extends StatelessWidget {
  const TextFormFieldIsNotEmpty({
    super.key,required this.validator, required this.controller, required this.hintText, required this.keyboardType, 
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        )
      );
  }
}

