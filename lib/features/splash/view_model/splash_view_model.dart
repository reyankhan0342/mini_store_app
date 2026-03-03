import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:mini_store_app/core/services/local_storage_service.dart';
import 'package:mini_store_app/features/home/view/home_view.dart';
import 'package:mini_store_app/features/onbaording/view/onboarding_view.dart';

class SplashViewModel extends ChangeNotifier {
  final LocalStorageService storage = LocalStorageService();

  SplashViewModel();

  Future<void> checkLoginAndNavigate() async {
    String? savedLang = await storage.getSelectedLanguage();

    if (savedLang == 'English') {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('ar'));
    }

    await Future.delayed(const Duration(seconds: 2));

    bool isLoggedIn = await storage.isLoggedIn();

    if (isLoggedIn) {
      Get.offAll(() => HomeScreen());
    } else {
      Get.offAll(() => const OnboardingView());
    }
  }
}
