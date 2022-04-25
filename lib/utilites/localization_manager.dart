import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:task/lang/ar.dart';
import 'package:task/lang/en.dart';
import 'package:task/utilites/setting_manager.dart';

class LocalizationManager extends Translations {
  static Locale locale = const Locale('ar', '');
  static Locale fallbackLocale = const Locale('en', 'US');
  static final langs = ['English', 'Arabic'];
  // Supported locales
  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', ''),
  ];

  // Keys and their translations
@override
  Map<String, Map<String, String>> get keys => {
        'en': en, // lang/en_us.dart
        'ar': ar, // lang/tr_tr.dart
        // lang/ja_jp.dart
      };

  // Gets locale from language, and updates the locale
  static void changeLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (Get.locale!.languageCode == 'ar') {
      isArabic = false;
      globalLang = 'en';
      await prefs.setString(PrefsKeys.languageKey, 'en');
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      isArabic = true;
      globalLang = 'ar';
      await prefs.setString(PrefsKeys.languageKey, 'ar');
      Get.updateLocale(const Locale('ar', ''));
    }

  }

  static Future<void> getlocal() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? lang = preferences.getString(PrefsKeys.languageKey);

    if (lang == null) {
      globalLang = 'ar';
      isArabic = true;
      preferences.setString(PrefsKeys.languageKey, 'ar');
      Get.updateLocale(const Locale('ar', ''));
    } else if (lang == 'ar') {
      globalLang = 'ar';
      isArabic = true;
      preferences.setString(PrefsKeys.languageKey, 'ar');
      Get.updateLocale(const Locale('ar', ''));
    } else {
      globalLang = 'en';
      isArabic = false;
      preferences.setString(PrefsKeys.languageKey, 'en');
      Get.updateLocale(const Locale('en', 'US'));
    }
  }



}
