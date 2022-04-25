import 'package:flutter/material.dart';

class ColorManager{
  static   Color primary = HexColor.fromhex('#4F0091');
  static Color primaryOpacity =  HexColor.fromhex('#4F0091').withOpacity(.6);
  static Color text =  HexColor.fromhex('#3A4759');
  static Color backgroundColor =  HexColor.fromhex('#F2F5FC');
  static Color yellow =  HexColor.fromhex('#FFD100');
  static Color calenderTitle =  HexColor.fromhex('#8C8C8C');
  static Color green =  HexColor.fromhex('#009877');
  static  Color grey = Colors.grey;
  static  Color grey1 = HexColor.fromhex('#707070');
  static  Color expanded = HexColor.fromhex('#F9FBFD');
  static  Color grey2 =Colors.blueGrey;
  static  Color dark = Colors.black87;
  static  Color light = Colors.white;
  static Color white =Colors.white;
  static Color black =Colors.black;
  static Color error =Colors.red;
  static const Color transparent =Colors.transparent;
}
extension HexColor on Color{
static  Color fromhex(String colorString){
    String hexColorString=colorString.replaceAll('#', '');
    if(hexColorString.length==6)hexColorString='FF'+hexColorString; // 8 char with opacity 100%
    Color newColor=Color(int.parse(hexColorString,radix: 16,),);
    return newColor;
  }
}