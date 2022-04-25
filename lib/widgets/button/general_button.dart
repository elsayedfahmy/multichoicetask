

import 'package:flutter/material.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/widgets/text/regular_text.dart';

class GeneralAppButton extends StatelessWidget {
  final Color? buttonColor;
  final String buttonTitle;
  final Color? buttonTitleColor;
  final double buttonRadius;
  final Function buttonOnTap;
  final double buttonWidth;
  final double buttonHeight;
  final double? titleSize;

  const GeneralAppButton({Key? key,
    required this.buttonTitle,
     this.buttonTitleColor,
  required this.buttonOnTap,
    required this.buttonHeight,
    required this.buttonWidth,
   this.buttonRadius=0,
   this.buttonColor,
   this.titleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>buttonOnTap(),
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonRadius),
          color: buttonColor??ColorManager.white
        ),
        child:  Center(
          child: RegularText(title: buttonTitle ,titleColor: buttonTitleColor,titleSize: titleSize),
        ),

      ),
    );
  }
}
