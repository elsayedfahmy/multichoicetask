import 'package:flutter/material.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';
import 'package:task/utilites/styles_manager.dart';

class SemiBoldText extends StatelessWidget {
  final String title;
  final int maxLine;
  final TextAlign textAlign;
  final Color? titleColor;
  final double? titleSize;
  const SemiBoldText({Key? key,required this.title,this.maxLine=1,this.textAlign=TextAlign.start,this.titleColor,this.titleSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getTextStylrSemiBold(color:titleColor?? ColorManager.text,fontSize:titleSize?? FontSize.s14),
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
