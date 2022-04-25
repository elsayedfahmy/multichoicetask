import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task/data/auth_provider.dart';
import 'package:task/domain/model/login_post_model.dart';
import 'package:task/utilites/route_manager.dart';

class LoginData{
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  var formkey = GlobalKey<FormState>();


  Future<void> login({required BuildContext context})async{
    if(formkey.currentState!.validate()){
      /// login
      FocusScope.of(context).unfocus();
      LoginPostModel _loginPostModel=LoginPostModel(email:emailController.text, password: passwordController.text);
      context.read<AuthProvider>().login(context: context,loginPostModel: _loginPostModel);
    }
  }

  void goToRegister({required BuildContext context})async{
    FocusScope.of(context).unfocus();
    gotoScreen(screenName: Routes.registerView, arguments: null);
  }

}

