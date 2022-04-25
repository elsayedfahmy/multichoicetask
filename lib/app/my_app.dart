import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task/data/auth_provider.dart';
import 'package:task/data/payment_provider.dart';
import 'package:task/utilites/localization_manager.dart';
import 'package:task/utilites/responsive_manager.dart';
import 'package:task/utilites/route_manager.dart';
import 'package:task/utilites/theme_manager.dart';

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);
   const MyApp._interneal(); // private contractor
 static const MyApp instanse=MyApp._interneal(); // single instanse // singlton

  factory MyApp()=>instanse;  // factory for the class instanse

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
      ],
      child: GetMaterialApp(
        theme: getApplicationThemeData(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashView,
        debugShowCheckedModeBanner: false,
        locale: LocalizationManager.locale,
        // locale: Get.deviceLocale,
        fallbackLocale: LocalizationManager.fallbackLocale,
        translations: LocalizationManager(),
      ),
    );
  }
}
