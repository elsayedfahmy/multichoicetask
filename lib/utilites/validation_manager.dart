
import 'package:get/get.dart';
import 'package:task/utilites/string_manager.dart';

enum TextValidationType{
  email,
  password,
  confirmPassword,
  phone,
  text,
}

RegExp regExpEmail = RegExp(
  r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))+$',
  caseSensitive: false,
  multiLine: false,
);

RegExp regExpPassword = RegExp(
  r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{7,}$',

);

String? validationText({required String text,required  TextValidationType type, String? confirmPasswordText}){

  if(type==TextValidationType.email){
    if(text.isEmpty) {
      return StringManager.required.tr;
    }
  else  if(!text.isEmail) {
      return StringManager.enterEmailCorrectly.tr;
    }
   else  if (!regExpEmail.hasMatch(text)) {
      return StringManager.enterEmailCorrectly.tr;
    }
  else {
      return null;
    }
  }

  if(type==TextValidationType.phone){
    if(text.isEmpty) {
      return StringManager.required.tr;
    }
  else  if(!text.isPhoneNumber) {
      return StringManager.required.tr;
    }
  else {
      return null;
    }
  }

  if(type==TextValidationType.text){
    if(text.isEmpty) {
      return StringManager.required.tr;
    }
  else {
      return null;
    }
  }


  if(type==TextValidationType.password){
    if(text.isEmpty) {
      return StringManager.required.tr;
    }

  else  if (!regExpPassword.hasMatch(text)) {
      return StringManager.enterPasswordCorrectly.tr;
    }
    else {
      return null;
    }
  }
  if(type==TextValidationType.confirmPassword){
    if(confirmPasswordText==null) {
      return StringManager.required.tr;
    }

    else  if (text!=confirmPasswordText) {
      return StringManager.passwordDoesNotMatch.tr;
    }
    else {
      return null;
    }
  }


    return null;
}