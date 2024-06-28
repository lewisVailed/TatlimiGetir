import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';

class Textbutton extends StatelessWidget {
  const Textbutton({
    super.key, this.onPressed, required this.buttonName, this.textDecoration=TextDecoration.none,
  });
  final void Function()? onPressed;
  final String buttonName;
  final TextDecoration textDecoration;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, 
    child: Text(buttonName,style: context.textTheme().bodyLarge?.copyWith(
      color: ProjectColors.appbarColor,
      decoration: textDecoration,
      decorationColor: ProjectColors.appbarColor
    ),));
  }
}