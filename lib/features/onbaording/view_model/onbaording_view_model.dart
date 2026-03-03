import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:mini_store_app/core/%20constants/app_string.dart';
import 'package:mini_store_app/core/services/local_storage_service.dart';
import 'package:mini_store_app/features/auth/view/login_view.dart';

class OnboardingViewModel extends ChangeNotifier {
  int currentPage = 0;
  final AppStrings appStrings = AppStrings();
  final LocalStorageService storage = LocalStorageService();

  String selectedLanguage = 'Arabic';

  OnboardingViewModel() {
    loadSelectedLanguage();
  }

  void changeOnboardingPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  Future<void> loadSelectedLanguage() async {
    selectedLanguage = await storage.getSelectedLanguage() ?? 'Arabic';
    _updateLocale();
    notifyListeners();
  }

  Future<void> isLanguage(String value) async {
    selectedLanguage = value;
    await storage.saveSelectedLanguage(value);
    _updateLocale();
    notifyListeners();
  }

  void _updateLocale() {
    if (selectedLanguage == 'English') {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('ar'));
    }
  }
}
