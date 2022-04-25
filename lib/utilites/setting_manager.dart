
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/domain/model/user_data.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/route_manager.dart';

bool isArabic = true;
bool isLogin = false;
String globalLang = 'en';
UserData? userdata;


class PrefsKeys{
static const String  languageKey='languageKey';
static const String  prefUserkey='prefUserkey';
}


void showInSnackBar({required BuildContext context ,required String message}) {
  var snackBar = SnackBar(content: Text(message),backgroundColor: ColorManager.primary,);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


class SaveLocalData{
  static savePrefUserInfo({required UserData userdata}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(PrefsKeys.prefUserkey, json.encode(userdata.toJson()));
    userdata=userdata;
    isLogin=true;

  }

  static Future<UserData?>getUSerPrefsData()async{
    userdata=null;
    isLogin=false;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? data= preferences.getString(PrefsKeys.prefUserkey,);

    if(data==null)return null;
    userdata=UserData.fromJson(json.decode(data));
    isLogin=true;
    log('----- toke---- ${userdata!.token}');
    return userdata;
  }
  static logOut(BuildContext context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    userdata=null;
    isLogin=false;
    gotoIntro(screenName: Routes.splashView, context: context);
  }
}