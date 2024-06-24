import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext{
  double dynamicHeight(double val) => MediaQuery.sizeOf(this).height * val;
  double dynamicWidht(double val) => MediaQuery.sizeOf(this).width * val;

  TextTheme textTheme(){
    return Theme.of(this).textTheme;
  }
}

extension NumberExtensions on BuildContext{
  double get lowValue => dynamicHeight(0.01);
  double get mediumValue => dynamicHeight(0.03);
  double get highValue => dynamicHeight(0.05);
  double get buttonHeightValue => dynamicHeight(0.06);
}

extension PaddingExtensions on BuildContext{
  EdgeInsets get paddingAllLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingColumnHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  
}