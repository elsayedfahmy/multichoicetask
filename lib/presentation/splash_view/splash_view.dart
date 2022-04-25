import 'package:flutter/material.dart';
import 'package:task/domain/model/user_data.dart';
import 'package:task/utilites/image_manager.dart';
import 'package:task/utilites/localization_manager.dart';
import 'package:task/utilites/responsive_manager.dart';
import 'package:task/utilites/route_manager.dart';
import 'package:task/utilites/setting_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    setApp();
  }
  setApp()async{
    UserData? userData= await SaveLocalData.getUSerPrefsData();
    await LocalizationManager.getlocal();
    Future.delayed(const Duration(seconds: 2),()async{
      if(userData==null) {
        gotoIntro(screenName: Routes.loginView,context: context);
      }else{
        gotoIntro(screenName: Routes.paymentView, context: context);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    ResponsiveManager().init(context);
    return Scaffold(
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        decoration: const BoxDecoration(
          image:DecorationImage(
            image: AssetImage(ImageManager.splashBackground,),
            fit: BoxFit.fill,
          )
        ),
        child:
        Center(child: Image.asset(ImageManager.logo,width: 0.25.sw,height: 0.25.sh)),
      ),
    );
  }
}
