import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExtension on BuildContext{
  double dynamicHeight(double val) => MediaQuery.sizeOf(this).height * val;
  double dynamicWidht(double val) => MediaQuery.sizeOf(this).width * val;

  TextTheme textTheme(){
    return Theme.of(this).textTheme;
  }
}

extension NumberExtensions on BuildContext{
  double get lowValue1 => dynamicHeight(0.01);
  double get lowValue2 => dynamicHeight(0.02);
  double get mediumValue => dynamicHeight(0.03);
  double get highValue => dynamicHeight(0.05);
  double get buttonHeightValue => dynamicHeight(0.06);
  double get selfScrollingImagesHeight => dynamicHeight(0.30);
  double get tabBarHeightValue => dynamicHeight(0.08);
  double get dessertImageSize => dynamicWidht(0.25);
}

extension PaddingExtensions on BuildContext{
  EdgeInsets get paddingAllLow => EdgeInsets.all(lowValue1);
  EdgeInsets get paddingAllLow2 => EdgeInsets.all(lowValue2);
  EdgeInsets get paddingColumnHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingColumnHorizontalLow => EdgeInsets.symmetric(horizontal: lowValue1);
  EdgeInsets get paddingColumnVerticalLow => EdgeInsets.symmetric(vertical: lowValue2);
  
}