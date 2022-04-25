import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/domain/ApiService.dart';
import 'package:task/domain/controller/payment_controller.dart';
import 'package:task/domain/model/login_post_model.dart';
import 'package:task/domain/model/month_dat_model.dart';
import 'package:task/domain/model/payment_model.dart';
import 'package:task/domain/model/payment_post_model.dart';
import 'package:task/domain/model/register_post_model.dart';
import 'package:task/domain/model/user_data.dart';
import 'package:task/utilites/enums.dart';
import 'package:task/utilites/route_manager.dart';
import 'package:task/utilites/setting_manager.dart';

class PaymentProvider with ChangeNotifier, DiagnosticableTreeMixin {
  HalaPaymentModel? halaPaymentModel;
   bool _isLoading =false;
    int page=0;
    int pageSize=10;
    List<String>months=['01','02','03','04','05','06','07','08','09','10','11','12'];
    List<String>years=['2020','2021','2022','2023','2024','2025','2026',];
  String? fromDay;
  String? fromYear;
  String? fromMonth;
  String? toYear;
  String? toMonth;
  String? toDay;

  List<String>  getToYears(){
    if(fromYear==null) {
      return years;
    } else {
      List<String>newYears=[];
      for(String year in years){
     if(int.parse(year)>=int.parse('$fromYear'))   newYears.add(year);
    }
      return newYears;
    }
  }
  // setFromYear(String? year){
  //   fromYear=year;
  //   notifyListeners();
  // }
  // setFromYear(String? year){
  //   fromYear=year;
  //   notifyListeners();
  // }
    // List<MonthDayModel>monthDayList=[
    //   MonthDayModel(month: '01',days: getDays('01')),
    //   MonthDayModel(month: '02',days: '29'),
    //   MonthDayModel(month: '03',days: '31'),
    //   MonthDayModel(month: '04',days: '30'),
    //   MonthDayModel(month: '05',days: '31'),
    //   MonthDayModel(month: '06',days: '30'),
    //   MonthDayModel(month: '07',days: '31'),
    //   MonthDayModel(month: '08',days: '31'),
    //   MonthDayModel(month: '09',days: '30'),
    //   MonthDayModel(month: '10',days: '31'),
    //   MonthDayModel(month: '11',days: '30'),
    //   MonthDayModel(month: '12',days: '31'),
    // ];
List<String>getDays(String month){
  switch (month){
    case '02':return [for(var i=1; i<=29; i+=1) i<10?'0$i':'$i'];
    case '04':return [for(var i=1; i<=30; i+=1) i<10?'0$i':'$i'];
    case '06':return [for(var i=1; i<=30; i+=1) i<10?'0$i':'$i'];
    case '09':return [for(var i=1; i<=30; i+=1) i<10?'0$i':'$i'];
    case '11':return [for(var i=1; i<=30; i+=1) i<10?'0$i':'$i'];
    default:return [for(var i=1; i<=31; i+=1) i<10?'0$i':'$i'];
    // default:return List<int>.generate(31, (i) => i + 1);
  }
}
   bool get isLoading => _isLoading;
    setIsLoading(bool value) {
     _isLoading = value;
     notifyListeners();
   }

getHalaPayments({required BuildContext context,})async{
  _isLoading=true;
  notifyListeners();
  page=1;
   halaPaymentModel=await PaymentController.getHalaPayments(context: context, page: page, pageSize: pageSize,
    fromDate:'$fromYear-$fromMonth-$fromDay',toDate:'$toYear-$toMonth-$toDay');
  _isLoading=false;
  notifyListeners();
}


  getMoreHalaPayments({required BuildContext context,})async{
      if(halaPaymentModel!=null&&halaPaymentModel!.totalPages==page)return;
    _isLoading=true;
    notifyListeners();
    page=page+1;
      HalaPaymentModel?  newHalaPaymentModel =await PaymentController.getHalaPayments(context: context, page: page, pageSize: pageSize,
          fromDate:'$fromYear-$fromMonth-$fromDay',toDate:'$toYear-$toMonth-$toDay');
      if(newHalaPaymentModel!=null){
        halaPaymentModel!.pageNumber=newHalaPaymentModel.pageNumber;
        halaPaymentModel!.pageSize=newHalaPaymentModel.pageSize;
        halaPaymentModel!.firstPage=newHalaPaymentModel.firstPage;
        halaPaymentModel!.lastPage=newHalaPaymentModel.lastPage;
        halaPaymentModel!.totalPages=newHalaPaymentModel.totalPages;
        halaPaymentModel!.totalRecords=newHalaPaymentModel.totalRecords;
        halaPaymentModel!.nextPage=newHalaPaymentModel.nextPage;
        halaPaymentModel!.previousPage=newHalaPaymentModel.previousPage;
        halaPaymentModel!.succeeded=newHalaPaymentModel.succeeded;
        halaPaymentModel!.errors=newHalaPaymentModel.errors;
        halaPaymentModel!.message=newHalaPaymentModel.message;
        halaPaymentModel!.data!.addAll(newHalaPaymentModel.data!);
      }
    _isLoading=false;
    notifyListeners();
  }





  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(IntProperty('count', count));
  }
}