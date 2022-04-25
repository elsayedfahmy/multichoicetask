import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/domain/ApiService.dart';
import 'package:task/domain/model/login_post_model.dart';
import 'package:task/domain/model/register_post_model.dart';
import 'package:task/domain/model/user_data.dart';
import 'package:task/utilites/enums.dart';
import 'package:task/utilites/route_manager.dart';
import 'package:task/utilites/setting_manager.dart';

class AuthProvider with ChangeNotifier, DiagnosticableTreeMixin {
   bool _isLoading =false;
   bool get isLoading => _isLoading;
    setIsLoading(bool value) {
     _isLoading = value;
     notifyListeners();
   }

login({required BuildContext context,required LoginPostModel loginPostModel})async{
  _isLoading=true;
  notifyListeners();
  var result = await ApiService.callService(
      actionType: ActionType.post, apiName: 'AccountSetting/Login', body:loginPostModel.toJson(), context: context);

 
  try{
    // List<Role>roles=[];
    // for(String role in result['roles'].toString().split(',')){
    //   roles.add(getRole(role: role));
    // }
    if(result!=null) {
      UserData userData= userDataFromJson(jsonEncode(result));
      await SaveLocalData.savePrefUserInfo(userdata: userData);
      gotoIntro(screenName: Routes.paymentView, context: context);
    }
  }catch(e){
    dev.log('--------------- catch error ---------------------');
    dev.log(e.toString());

  }
  _isLoading=false;
  notifyListeners();
}



   register({required BuildContext context,required RegisterPostModel registerPostModel})async{
     _isLoading=true;
     notifyListeners();
     var result = await ApiService.callService(
         actionType: ActionType.post, apiName: 'AccountSetting/Register',
         body:registerPostModel.toJson(), context: context);


     try{
       if(result!=null) {
         gotoIntro(screenName: Routes.loginView, context: context);
         showInSnackBar(context: context,message:registerPostModel.toString().replaceAll('"', '') );

       }
     }catch(e){
       dev.log('--------------- catch error ---------------------');
       dev.log(e.toString());

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