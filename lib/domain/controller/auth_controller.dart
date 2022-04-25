
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:task/domain/ApiService.dart';
import 'package:task/domain/model/login_post_model.dart';
import 'package:task/domain/model/register_post_model.dart';
import 'package:task/domain/model/user_data.dart';

class AuthController{
  static Future< UserData?> login({required BuildContext context ,required LoginPostModel loginPostModel})async{
  var result = await ApiService.callService(
  actionType: ActionType.post, apiName: 'AccountSetting/Login', body:loginPostModel.toJson(), context: context);
  UserData? userData;
  if(result==null)return  userData;
  try{

   userData= userDataFromJson(jsonEncode(result));

  }catch(e){
  dev.log('--------------- catch error ---------------------');
  dev.log(e.toString());

  }
    return userData;
  }


  static Future< String?> register({required BuildContext context ,required RegisterPostModel registerPostModel})async{
    var result = await ApiService.callService(
        actionType: ActionType.post, apiName: 'AccountSetting/Register',
        body:registerPostModel.toJson(), context: context);
    if(result==null)return null;
    return result.toString();
  }

}