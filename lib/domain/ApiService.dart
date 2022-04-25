import 'dart:convert';
import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task/domain/model/response_model.dart';
import 'package:task/utilites/setting_manager.dart';


enum ActionType { get, post }
String serviceURL='https://task.atc-servers.com/api/';
class ApiService {

  static  callService({required  ActionType? actionType, required  String?apiName,
    required Map? body,required BuildContext context}) async {
    var apiurl =serviceURL + apiName!;
  try{

    Dio dio =  Dio();
    dio.options.headers['content-Type'] = 'application/json';
    if(userdata!=null&&userdata?.token!=null) {
      dio.options.headers["authorization"] = "Bearer ${userdata?.token}";
    }

    var  response = actionType==ActionType.get?await dio.get(apiurl):await dio.post(apiurl, data: body);
    dev.log('--- apiurl ---- :$apiurl');
    dev.log('--- body with post ---- :${body.toString()}');
    // dev.log('--- response ---- :$response');
    dev.log('--- response statusCode ---- :${response.statusCode.toString()}');
    dev.log('--- response body ---- :${response.data.toString()}');

    if(response.statusCode==200){
      int responseCode=response.data['responseCode'];
      if(responseCode==1) {
        return response.data['dateSet'];
      } else{
        showInSnackBar(context: context,message:response.data['responseMessage'].toString() );
        return null;
      }

    }else{
      showInSnackBar(context: context,message:'error 500' );
      return null;
    }



  }catch(e){
    dev.log('--------------- app sevice catch error ---------------------');
    dev.log(e.toString());

    return null;
  }




//     if (response.statusCode == 200) {
//     if(response.body==null)
//     return null;
//     var data =jsonDecode(response.body);
//    if ( apiName.contains('chage-payment-status-order'))return 'done';
//     else return data['data'] ;
//     }
//     else if(response.statusCode == 403) {
//
//     var data =jsonDecode(response.body);
//     debugPrint('error ==> ${data['message'].toString()}');
//     if(data['message']==null){
//
//       showAlert(title: AppWords.error.tr ,message: AppWords.tryAgain.tr);
//     return null;
//     }
//     else if(
//     data['message'].toString().toLowerCase().trim()=='Invalid email or password'.toLowerCase().trim()||
//     data['message'].toString().toLowerCase().trim()=='Invalid phone or password'.toLowerCase().trim()
//     ){
//
//       showAlert(title: AppWords.error.tr ,message: AppWords.invalidphoneorpassword.tr);
//     return null;
//     }
//     showAlert(title: AppWords.error.tr ,message:data['message'].toString().replaceAll('{', '')
//         .replaceAll('}', '')..replaceAll('[', '').replaceAll(']', '')
//     );
//     return null;
//     }
//
//     else {
// debugPrint('error'+'-----'*30);
//       // showAlert(title: AppWords.error.tr ,message: AppWords.tryAgain.tr);
//     return null;
//     }
    }


static  bool checkIfTrue(String url){
    if(
    url.contains('add-view-ad')||
    url.contains('like-company')||
    url.contains('unlike-company')||
    url.contains('un-whishlist-company')||
    url.contains('unlike-ad')||
    url.contains('like-ad')||
    url.contains('add-comment-ad')||
    url.contains('delete-company-ad')||
    url.contains('add-company-comment')||
    url.contains('delete-company-comment')||
    url.contains('delete-ad')||
    url.contains('un-saved-ad')||
    url.contains('saved-ad')||
    url.contains('register-user')||
    url.contains('validate-mobile')||
    url.contains('resend-opt-code')||
    url.contains('change-password')||
    url.contains('change-info')||
    url.contains('ad-delete-image-gallery')||
    url.contains('ad-delete-video')||
        url.contains('rate-company')
    )return true;
    else return false;
  }

  }

