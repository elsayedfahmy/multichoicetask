import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task/data/auth_provider.dart';
import 'package:task/presentation/login_view/login_data.dart';
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

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginData{
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   LoadingWidget(
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
                  Space(height: 0.1.sh,),
                  //------ image logo
                  Image.asset(ImageManager.logo,width: 0.25.sw,height: 0.25.sh),


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
                    textInputAction: TextInputAction.done,
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
                    inputType: TextInputType.emailAddress,
                    onSubmit: (v)=>login(context: context),
                    textInputAction: TextInputAction.next,
                    controller: passwordController,
                  ),
                  const Space(height: 20,),

                  //------ loginButton
                  GeneralAppButton(
                    buttonHeight: FontSize.s50,
                    buttonWidth: .8.sw,
                    buttonOnTap: ()=>login(context: context),
                    buttonTitle: StringManager.login.tr,
                    buttonColor: ColorManager.primary,
                    buttonRadius: FontSize.s10,
                    buttonTitleColor: ColorManager.white,
                    titleSize: FontSize.s14,
                  ),

                  const Space(height: 20,),
                  //------ register Button
                  GeneralAppButton(
                    buttonHeight: FontSize.s50,
                    buttonWidth: .8.sw,
                    buttonOnTap: ()=>goToRegister(context: context),
                    buttonTitle: StringManager.register.tr,
                    buttonColor: ColorManager.primary,
                    buttonRadius: FontSize.s10,
                    buttonTitleColor: ColorManager.white,
                    titleSize: FontSize.s14,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
