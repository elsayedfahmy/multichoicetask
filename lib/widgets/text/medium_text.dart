import 'package:flutter/material.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';
import 'package:task/utilites/styles_manager.dart';

class MediumText extends StatelessWidget {
  final String title;
  final int maxLine;
  final TextAlign textAlign;
  const MediumText({Key? key,required this.title,this.maxLine=1,this.textAlign=TextAlign.start}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getTextStylrMedium(color: ColorManager.text,fontSize: FontSize.s14),
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
