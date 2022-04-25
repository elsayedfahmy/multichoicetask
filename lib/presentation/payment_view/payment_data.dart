

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task/data/payment_provider.dart';
import 'package:task/domain/model/user_data.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/responsive_manager.dart';
import 'package:task/utilites/setting_manager.dart';
import 'package:task/utilites/string_manager.dart';
import 'package:task/widgets/alerts.dart';
import 'package:task/widgets/drop_down_button/drop_down_button_calender.dart';

class PaymentData{

  ScrollController scrollController=ScrollController();
 late BuildContext cxt;
  Future<void> getData({required BuildContext context})async{
    cxt=context;
    //'2020-01-01',toDate:'2022-05-01'
    //- set start date
    context.read<PaymentProvider>().fromDay='01';
    context.read<PaymentProvider>().fromMonth='01';
    context.read<PaymentProvider>().fromYear='2020';
    //- set end date
    context.read<PaymentProvider>().toDay='01';
    context.read<PaymentProvider>().toMonth='05';
    context.read<PaymentProvider>().toYear='2022';
    UserData? userData= await SaveLocalData.getUSerPrefsData();
    context.read<PaymentProvider>().getHalaPayments(context: context);
  }

  bool onNotification(ScrollNotification notification,) {
    if (notification is ScrollUpdateNotification) {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        cxt.read<PaymentProvider>().getMoreHalaPayments(context: cxt);
      }
    }
    return true;
  }

  showCalender({required BuildContext context}){
    Alerts.showCalenderAlert(context: context);
    // showModalBottomSheet(
    //     context: context,
    //     builder: (BuildContext bc) {
    //       return SafeArea(
    //         child: Container(
    //           color: ColorManager.white,
    //           height: 0.5.sh,
    //           width: 1.0.sw,
    //           child:  Wrap(
    //             children:  <Widget>[
    //               CalenderDropButton(
    //                 onChanged: (String? year){
    //                   context.read<PaymentProvider>().setFromYear(year);
    //                 },
    //                 hintText: StringManager.year.tr,initaldata: context.watch<PaymentProvider>().fromYear,
    //                 list: context.read<PaymentProvider>().years,),
    //
    //             ],
    //           ),
    //         ),
    //       );
    //     }
    // );
  }
}

