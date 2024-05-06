import 'package:flutter/material.dart';

import '../font/font_manger.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontFamily) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
      FontConstants.fontFamilyHeadline);
}

// regular style
TextStyle getHeadLineSmaller(
    {double fontSize = FontSize.s15, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.bold, color, FontConstants.fontFamilyContent);
}

TextStyle getHeadLineStyle(
    {double fontSize = FontSize.s22, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color,
      FontConstants.fontFamilyHeadline);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
      FontConstants.fontFamilyContent);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color,
      FontConstants.fontFamilyContent);
}

TextStyle getContentStyle(
    {double fontSize = FontSize.s17, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,
      FontConstants.fontFamilyContent);
}

TextStyle getContentCardStyle(
    {double fontSize = FontSize.s17, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular2, color,
      FontConstants.fontFamilyContent);
}

TextStyle getButtonTxtStyle(
    {double fontSize = FontSize.s15, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,
      FontConstants.fontFamilyContent);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.bold, color, FontConstants.fontFamilyContent);
}

TextStyle getSmallHeaderStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.bold, color, FontConstants.fontFamilyContent);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s22, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.semiBold, color, FontConstants.fontFamily);
}
