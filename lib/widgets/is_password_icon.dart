
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';

class IsPasswordIcon extends StatelessWidget {
  final bool isPassWord;
  const IsPasswordIcon({Key? key,required this.isPassWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      isPassWord?Icons.remove_red_eye:
      Icons.remove_red_eye,
      color: ColorManager.primary,size: FontSize.s18,);
  }
}
