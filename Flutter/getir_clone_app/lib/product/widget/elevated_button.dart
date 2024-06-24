import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';

class Elevatedbutton extends StatelessWidget {
  const Elevatedbutton({
    super.key,required this.onPressed, required this.buttonName,
  });
  final void Function()? onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidht(1),
      height: context.buttonHeightValue,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ProjectColors.appbarColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
        ),
        child: Text(buttonName,style: context.textTheme().bodyLarge?.copyWith(color: Colors.white),),
        ),
    );
  }
}