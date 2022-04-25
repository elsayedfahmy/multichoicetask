import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task/data/auth_provider.dart';
import 'package:task/presentation/login_view/login_data.dart';
import 'package:task/presentation/register_view/register_data.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';
import 'package:task/utilites/image_manager.dart';
import 'package:task/utilites/responsive_manager.dart';
import 'package:task/utilites/setting_manager.dart';
import 'package:task/utilites/string_manager.dart';
import 'package:task/utilites/validation_manager.dart';
import 'package:task/widgets/button/general_button.dart';
import 'package:task/widgets/is_password_icon.dart';
import 'package:task/widgets/loadin_widget.dart';
import 'package:task/widgets/space.dart';
import 'package:task/widgets/text/medium_text.dart';
import 'package:task/widgets/text_field/email_text_field.dart';
import 'package:task/widgets/text_field/general_text_field.dart';
import 'package:task/widgets/text_field/password_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with RegisterData{
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingWidget(
        isLoading: context.watch<AuthProvider>().isLoading,
        child: Container(
          height: 1.0.sh,
          width: 1.0.sw,
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          decoration:const  BoxDecoration(
              image:DecorationImage(
                image: AssetImage(ImageManager.splashBackground,),
                fit: BoxFit.fill,
              )
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Space(height: 0.02.sh,),
                  //------ image logo
                  Image.asset(ImageManager.logo,width: 0.25.sw,height: 0.22.sh),

                  //------ phone text field and title
                  Row(
                    children: [
                      MediumText(title: StringManager.fullname.tr),
                    ],
                  ),
                  const Space(height: 8,),
                  EmailTextField(
                    onChanged: (v){},
                    labelTitle: StringManager.fullname.tr,
                    hintTitle: StringManager.fullname.tr,
                    onvalidator: (v)=>validationText(text: v.toString(), type: TextValidationType.text),
                    inputType: TextInputType.text,
                    onSubmit: (v){},
                    textInputAction: TextInputAction.next,
                    controller: fullNameController,
                  ),


                  //------ phone text field and title
                  Row(
                    children: [
                      MediumText(title: StringManager.phone.tr),
                    ],
                  ),
                 const Space(height: 8,),
                  EmailTextField(
                    onChanged: (v){},
                    labelTitle: StringManager.phone.tr,
                      hintTitle: StringManager.phone.tr,
                    onvalidator: (v)=>validationText(text: v.toString(), type: TextValidationType.phone),
                    inputType: TextInputType.phone,
                    onSubmit: (v){},
                    textInputAction: TextInputAction.next,
                    controller: phoneController,
                  ),



                  //------ email text field and title
                  Row(
                    children: [
                      MediumText(title: StringManager.email.tr),
                    ],
                  ),
                  const Space(height: 8,),
                  EmailTextField(
                    onChanged: (v){},
                    labelTitle: StringManager.email.tr,
                    hintTitle: StringManager.email.tr,
                    onvalidator: (v)=>validationText(text: v.toString(), type: TextValidationType.email),
                    inputType: TextInputType.emailAddress,
                    onSubmit: (v){},
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                  ),


                  const Space(height: 8,),
                  //------ password text field and title
                  Row(
                    children: [
                      MediumText(title: StringManager.passWord.tr),
                    ],
                  ),
                  const Space(height: 8,),
                  PassWordTextField(
                    onChanged: (v){},
                    labelTitle: StringManager.passWord.tr,
                      hintTitle: StringManager.passWord.tr,
                    onvalidator:  (v)=>validationText(text: v.toString(), type: TextValidationType.password),
                    inputType: TextInputType.visiblePassword,
                    onSubmit: (v)=>register(context: context),
                    textInputAction: TextInputAction.next,
                    controller: passwordController,
                  ),



                  const Space(height: 8,),
                  //------confirm  password text field and title
                  Row(
                    children: [
                      MediumText(title: StringManager.confirmPassword.tr),
                    ],
                  ),
                  const Space(height: 8,),
                  PassWordTextField(
                    onChanged: (v){},
                    labelTitle: StringManager.confirmPassword.tr,
                      hintTitle: StringManager.confirmPassword.tr,
                    onvalidator:  (v)=>validationText(text: passwordController.text, type: TextValidationType.confirmPassword,
                        confirmPasswordText: v.toString()),
                    inputType: TextInputType.visiblePassword,
                    onSubmit: (v)=>register(context: context),
                    textInputAction: TextInputAction.next,
                    controller: confirmPasswordController,
                  ),
                  const Space(height: 20,),

                  Row(
                    children: [
                      SizedBox(
                        height: 60.0.h,
                        width: 0.4.sw,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor:ColorManager.grey ,
                              disabledColor: ColorManager.primary),
                          child: RadioListTile(
                            title:const MediumText(title: 'admin'),
                            activeColor: ColorManager.primary,
                            value: roleRadoiValue,
                            groupValue: 0,
                            onChanged: (v) {
                              roleRadoiValue=0;
                              setState(() {

                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.0.h,
                        width: 0.4.sw,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor:ColorManager.grey ,
                              disabledColor: ColorManager.primary),
                          child: RadioListTile(
                            title:const MediumText(title: 'admin'),
                            activeColor: ColorManager.primary,
                            value: roleRadoiValue,
                            groupValue: 1,
                            onChanged: (v) {
                              roleRadoiValue=1;
                              setState(() {

                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  //------ loginButton
                  GeneralAppButton(
                    buttonHeight: FontSize.s50,
                    buttonWidth: .8.sw,
                    buttonOnTap: ()=>register(context: context),
                    buttonTitle: StringManager.register.tr,
                    buttonColor: ColorManager.primary,
                    buttonRadius: FontSize.s10,
                    buttonTitleColor: ColorManager.white,
                    titleSize: FontSize.s14,
                  ),

                  const Space(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
