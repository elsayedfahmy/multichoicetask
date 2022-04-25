


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';
import 'package:task/utilites/image_manager.dart';
import 'package:task/utilites/localization_manager.dart';
import 'package:task/utilites/responsive_manager.dart';
import 'package:task/utilites/setting_manager.dart';
import 'package:task/utilites/string_manager.dart';
import 'package:task/widgets/button/general_button.dart';
import 'package:task/widgets/space.dart';
import 'package:task/widgets/text/regular_text.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorManager.white,
        height: 1.0.sh,
            width: 0.7.sw ,
        child: Drawer(
          backgroundColor: ColorManager.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Space(height: 100.0.h,),
              Image.asset(ImageManager.logo,width: 0.25.sw,height: 0.22.sh),
              Space(height: 100.0.h,),
              GeneralAppButton(
                buttonHeight: FontSize.s40,
                buttonWidth: .5.sw,
                buttonOnTap: (){
                  Navigator.pop(context);
                  LocalizationManager.changeLocale();
                },
                buttonTitle:  isArabic?'English':'العربية',
                buttonColor: ColorManager.primary,
                buttonRadius: FontSize.s10,
                buttonTitleColor: ColorManager.white,
                titleSize: FontSize.s14,
              ),

              Space(height: 30.0.h,),
              GeneralAppButton(
                buttonHeight: FontSize.s40,
                buttonWidth: .5.sw,
                buttonOnTap: ()=>SaveLocalData.logOut(context),
                buttonTitle:StringManager.logout.tr,
                buttonColor: ColorManager.primary,
                buttonRadius: FontSize.s10,
                buttonTitleColor: ColorManager.white,
                titleSize: FontSize.s14,
              ),


          ],),
        ),
      ),
    );
  }
}

