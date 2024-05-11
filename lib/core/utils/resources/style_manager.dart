import 'package:flutter/material.dart';
import 'package:ony_x_delivery_service/core/utils/resources/color_manager.dart';

import 'font_manager.dart';

class FontStyles{

// regular style

  static TextStyle getRegularStyle({
    double fontSize=FontSize.s14,
    Color? color,
  }){
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.regular,
      color: color ?? ColorManager.primary
    );
  }

// medium style

  static TextStyle getMediumStyle({
    double fontSize=FontSize.s12,
    Color? color,
  }){
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.medium,
        color: color ?? ColorManager.primary
    );
  }

// bold style

  static TextStyle getBoldStyle(
      {double fontSize = FontSize.s12,
        Color? color,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
        color: color ?? ColorManager.primary
    );
  }

// semiBold style

  static TextStyle getSemiBoldStyle(
      {double fontSize = FontSize.s14, Color? color,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.semiBold,
        color: color ?? ColorManager.primary
    );
  }
}