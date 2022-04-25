

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task/data/auth_provider.dart';
import 'package:task/domain/model/register_post_model.dart';
import 'package:task/utilites/setting_manager.dart';
import 'package:task/utilites/string_manager.dart';

class RegisterData{
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmPasswordController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController fullNameController=TextEditingController();
  int roleRadoiValue=-1;
  var formkey = GlobalKey<FormState>();
  bool isPassowrd=true;

  Future<void> register({required BuildContext context})async{
    if(roleRadoiValue==-1){
      showInSnackBar(context: context, message: StringManager.selectRole.tr);
      return;
    }
    if(formkey.currentState!.validate()){
      /// register
      FocusScope.of(context).unfocus();
      RegisterPostModel _registerPostModel=RegisterPostModel(
          email:emailController.text, password: passwordController.text,
      roles: ['Admin'],fullName: fullNameController.text,phoneNumber:phoneController.text
      );
      context.read<AuthProvider>().register(context: context,registerPostModel: _registerPostModel);
    }
  }

}

