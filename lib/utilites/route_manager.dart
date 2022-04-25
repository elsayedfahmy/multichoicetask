import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/presentation/login_view/login_view.dart';
import 'package:task/presentation/payment_view/payment_view.dart';
import 'package:task/presentation/register_view/register_view.dart';
import 'package:task/presentation/splash_view/splash_view.dart';
import 'package:task/utilites/string_manager.dart';

class Routes{
  static const String main ='/';
  static const String splashView ='/splashView';
  static const String loginView ='/LoginView';
  static const String registerView ='/RegisterView';
  static const String paymentView ='/PaymentView';
}

class RouteGenerator{

  static Route<dynamic>getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashView :return MaterialPageRoute(builder: (context) => const SplashView(),);
      case Routes.loginView :return MaterialPageRoute(builder: (context) => const LoginView(),);
      case Routes.registerView :return MaterialPageRoute(builder: (context) => const RegisterView(),);
      case Routes.paymentView :return MaterialPageRoute(builder: (context) => const PaymentView(),);



      default:
       return  unDefiendRoute();

    }


  }
  static Route<dynamic>unDefiendRoute(){
    return MaterialPageRoute(builder: (context) => Scaffold(
      appBar: AppBar(title: const Text(StringManager.noRoutFounded)),
      body: const Center(child: Text(StringManager.noRoutFounded)),
    ));
  }
}



gotoScreen( {required String screenName,required Object? arguments}) {
  FocusScope.of(Get.context!).unfocus();
  Get.toNamed(screenName,arguments: arguments);
}

gotoScreenPopAndPushNamed( {required String screenName,required Object? arguments}) {
  // FocusScope.of(context).requestFocus(new FocusNode());
  FocusScope.of(Get.context!).unfocus();
  Get.offAndToNamed(screenName,arguments: arguments);

}

goBack([var result]) {
  //FocusScope.of(context).requestFocus(new FocusNode());
  FocusScope.of(Get.context!).unfocus();
  Get.back(result: result);
}

gotoWithRemoveRoute({required String screenName,required Object? arguments}) {
  // FocusScope.of(context).requestFocus(new FocusNode());
  FocusScope.of(Get.context!).unfocus();
  Navigator.of(Get.context!).pushNamedAndRemoveUntil(screenName, (Route<dynamic> route) => false);
  Navigator.pushNamed(Get.context!, screenName);
  // Get.ofa(screenName,arguments: arguments);
}
gotoIntro({required String screenName,required BuildContext context}) {
  FocusScope.of(context).unfocus();
  Get.offNamedUntil(screenName, (route) => false);

}
