import 'package:flutter/material.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';
import 'package:task/utilites/styles_manager.dart';
import 'package:task/utilites/values_manager.dart';

ThemeData getApplicationThemeData(){
  return ThemeData(
    //------  colors
    primaryColor: ColorManager.primary,
    accentColor: ColorManager.grey,
    primaryColorDark: ColorManager.dark,
    primaryColorLight: ColorManager.light,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryOpacity,
    // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey1),

    //------  card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
       elevation: AppSize.s4,
      shadowColor: ColorManager.grey
    ),

    //------  app bar theme
    appBarTheme:AppBarTheme(
      shadowColor: ColorManager.primaryOpacity,
    elevation: AppSize.s4,
    color: ColorManager.primaryOpacity,
    centerTitle: true,
      titleTextStyle: getTextStylrMedium(color: ColorManager.black,fontSize: FontSize.s16)
  ),

    //------  button thme
    buttonTheme: ButtonThemeData(
      disabledColor: ColorManager.grey1,
    buttonColor: ColorManager.primary,
    splashColor: ColorManager.primaryOpacity,
    shape: const StadiumBorder (),
  ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style:ElevatedButton.styleFrom(
        textStyle: getTextStylrMedium(color: ColorManager.black),
        primary: ColorManager.primaryOpacity,
        shadowColor: ColorManager.grey1,
        shape:  RoundedRectangleBorder (borderRadius: BorderRadius.circular(AppSize.s12)),
      )
    ),
    //------  text style
    textTheme: TextTheme(
      headline1: getTextStylrSemiBold(color: ColorManager.black,fontSize: FontSize.s16),
      subtitle1: getTextStylrMedium(color: ColorManager.grey1,fontSize: FontSize.s16),
      caption: getTextStylrRegular(color: ColorManager.grey1,fontSize: FontSize.s16),
      bodyText1: getTextStylrRegular(color: ColorManager.grey1,fontSize: FontSize.s16),
    ),
    //--------- input decroation for text field
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getTextStylrRegular(color: ColorManager.text),
      labelStyle: getTextStylrMedium(color: ColorManager.text),
      errorStyle: getTextStylrMedium(color: ColorManager.error),
      contentPadding: const EdgeInsets.all(PaddingManager.p12),
      enabledBorder:OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1, ),
        borderRadius: BorderRadius.circular(AppSize.s7),
      ),
      focusedBorder:OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s1, ),
        borderRadius: BorderRadius.circular(AppSize.s7),
      ),
      errorBorder:OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error,width: AppSize.s1, ),
        borderRadius: BorderRadius.circular(AppSize.s7),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s1, ),
        borderRadius: BorderRadius.circular(AppSize.s7),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s1, ),
        borderRadius: BorderRadius.circular(AppSize.s7),
      ),

    )
  );
}