
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:task/domain/ApiService.dart';
import 'package:task/domain/model/payment_model.dart';
import 'package:task/domain/model/payment_post_model.dart';

class PaymentController{
  static Future< HalaPaymentModel?> getHalaPayments({required BuildContext context ,required int page,required int pageSize,
    required String fromDate,required toDate}) async {
    PaymentPostModel _paymentPostModel=PaymentPostModel(fromDate: fromDate,toDate:toDate ,
        filter: Filter(pageNumber: page,pageSize: pageSize));
    var result = await ApiService.callService(actionType: ActionType.post, apiName: 'HalaTaskFlutter/HalaPayments',
        body:_paymentPostModel.toJson(), context: context);
    HalaPaymentModel? halaPaymentModel;
    if(result==null)return halaPaymentModel;
    try{

         halaPaymentModel= halaPaymentModelFromJson(jsonEncode(result));

    }catch(e){
      dev.log('--------------- catch error ---------------------');
      dev.log(e.toString());

    }
    return halaPaymentModel;
}

}