import 'package:flutter/material.dart';
import 'package:task/utilites/font_manager.dart';

TextStyle _getTextStyle(double fontSize,String fontFamily,FontWeight fontWeight ,Color color){
  return TextStyle(fontSize: fontSize,fontFamily: fontFamily,fontWeight: fontWeight,color: color);
}
// static const FontWeight bold=FontWeight.w700;
// static const FontWeight semiBold=FontWeight.w600;
// static const FontWeight medium=FontWeight.w500;
// static const FontWeight regular=FontWeight.w400;
// static const FontWeight light=FontWeight.w300;

//--- bold
TextStyle getTextStylrBold({double fontSize=FontSize.s12,String fontFamily =FontContants.fontFamily,required Color color}){
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.bold, color);
}

//--- Semi bold
TextStyle getTextStylrSemiBold({double fontSize=FontSize.s12,String fontFamily =FontContants.fontFamily,required Color color}){
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.semiBold, color);
}

//--- medium
TextStyle getTextStylrMedium({double fontSize=FontSize.s12,String fontFamily =FontContants.fontFamily,required Color color}){
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.medium, color);
}

//--- regular
TextStyle getTextStylrRegular({double fontSize=FontSize.s12,String fontFamily =FontContants.fontFamily,required Color color}){
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.regular, color);
}

//--- light
TextStyle getTextStylrLight({double fontSize=FontSize.s12,String fontFamily =FontContants.fontFamily,required Color color}){
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.light, color);
}