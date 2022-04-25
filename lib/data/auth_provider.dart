import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/domain/controller/auth_controller.dart';
import 'package:task/domain/model/login_post_model.dart';
import 'package:task/domain/model/register_post_model.dart';
import 'package:task/domain/model/user_data.dart';
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
  UserData? userData= await AuthController.login(context: context,  loginPostModel: loginPostModel);
  if(userData!=null){
    await SaveLocalData.savePrefUserInfo(userdata: userData);
    gotoIntro(screenName: Routes.paymentView, context: context);
  }
  _isLoading=false;
  notifyListeners();
}



   register({required BuildContext context,required RegisterPostModel registerPostModel})async{
     _isLoading=true;
     notifyListeners();
     String? message= await AuthController.register(context: context,  registerPostModel: registerPostModel);
     if(message!=null){
       gotoIntro(screenName: Routes.loginView, context: context);
       showInSnackBar(context: context,message:message.replaceAll('"', '') );
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