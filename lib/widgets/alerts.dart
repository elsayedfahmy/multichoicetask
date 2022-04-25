

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task/data/payment_provider.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';
import 'package:task/utilites/responsive_manager.dart';
import 'package:task/utilites/string_manager.dart';
import 'package:task/widgets/button/general_button.dart';
import 'package:task/widgets/drop_down_button/drop_down_button_calender.dart';
import 'package:task/widgets/space.dart';
import 'package:task/widgets/text/regular_text.dart';

class Alerts{

  static Future<dynamic> showCalenderAlert({required BuildContext context}) async {
    if(context.read<PaymentProvider>().fromMonth==null)context.read<PaymentProvider>().fromMonth='01';
    if(context.read<PaymentProvider>().toMonth==null) context.read<PaymentProvider>().toMonth='01';
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("My title"),
      contentPadding: const EdgeInsets.all(10),
      content:  Container(
          height: 0.28.sh,
          width: 1.0.sw,
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(4)),
          // constraints: BoxConstraints(
          //   maxHeight: .5.sh,
          //   minHeight: .4.sh
          // ),
          child:  StatefulBuilder(
            builder: (context, setState) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                //------- from date
                Row(
                  children: [
                    RegularText(
                        title: StringManager.fromDate.tr, titleColor: ColorManager.primary,titleSize: FontSize.s14),
                  ],
                ),
                const Space(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CalenderDropButton(
                      onChanged: (String? day){
                        context.read<PaymentProvider>().fromDay=day;

                        setState(() {

                        });
                      },
                      hintText: StringManager.day.tr,initaldata: context.read<PaymentProvider>().fromDay,
                      list: context.read<PaymentProvider>().getDays(
                          context.read<PaymentProvider>().fromMonth==null?'01':
                          '${ context.read<PaymentProvider>().fromMonth}'
                      ),),

                    CalenderDropButton(
                      onChanged: (String? month){
                        context.read<PaymentProvider>().fromMonth=month;
                        setState(() {

                        });
                      },
                      hintText: StringManager.month.tr,initaldata: context.read<PaymentProvider>().fromMonth,
                      list: context.read<PaymentProvider>().months,),


                    CalenderDropButton(
                      onChanged: (String? year){
                        context.read<PaymentProvider>().fromYear=year;
                        context.read<PaymentProvider>().toYear=null;
                        setState(() {

                        });
                      },
                      hintText: StringManager.year.tr,initaldata: context.read<PaymentProvider>().fromYear,
                      list: context.read<PaymentProvider>().years,),
                  ],
                ),


                const Space(height: 16,),
                //------- to date
                Row(
                  children: [
                    RegularText(
                        title: StringManager.toDate.tr, titleColor: ColorManager.primary,titleSize: FontSize.s14),
                  ],
                ),
                const Space(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CalenderDropButton(
                      onChanged: (String? day){
                        context.read<PaymentProvider>().toDay=day;
                        setState(() {

                        });
                      },
                      hintText: StringManager.day.tr,initaldata: context.read<PaymentProvider>().toDay,
                      list: context.read<PaymentProvider>().getDays(
                          context.read<PaymentProvider>().toDay==null?'01':
                          '${ context.read<PaymentProvider>().toDay}'
                      ),),

                    CalenderDropButton(
                      onChanged: (String? month){
                        context.read<PaymentProvider>().toMonth=month;
                        setState(() {

                        });
                      },
                      hintText: StringManager.month.tr,initaldata: context.read<PaymentProvider>().toMonth,
                      list: context.read<PaymentProvider>().months,),


                    CalenderDropButton(
                      onChanged: (String? year){
                        context.read<PaymentProvider>().toYear=year;
                        setState(() {

                        });
                      },
                      hintText: StringManager.year.tr,initaldata: context.read<PaymentProvider>().toYear,
                      list: context.read<PaymentProvider>().getToYears(),),
                  ],
                ),

                Divider(
                  color: ColorManager.grey.withOpacity(.5),
                ),
                GeneralAppButton(
                  buttonHeight: FontSize.s22,
                  buttonWidth: .8.sw,
                  buttonOnTap: (){
                    Navigator.pop(context);
                    context.read<PaymentProvider>().getHalaPayments(context: context);
                  },
                  buttonTitle: StringManager.search.tr,
                  buttonColor: ColorManager.transparent,
                  buttonRadius: FontSize.s10,
                  buttonTitleColor: ColorManager.error,
                  titleSize: FontSize.s14,
                ),
              ],
            ),
          )
      ),
      // actions: [
      //
      // ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }
}