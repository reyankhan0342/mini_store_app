import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_x/get_navigation/src/root/get_material_app.dart';
import 'package:mini_store_app/core/%20constants/app_string.dart';
import 'package:mini_store_app/core/services/local_storage_service.dart';
import 'package:mini_store_app/features/splash/splash_view.dart';
import 'package:mini_store_app/features/home/view/home_view.dart';
import 'package:provider/provider.dart';

import 'features/splash/view_model/splash_view_model.dart';
import 'features/auth/view_model/auth_view_model.dart';
import 'features/home/view_model/home_view_model.dart';
import 'features/cart/view_model/cart_view_model.dart';
import 'features/onbaording/view_model/onbaording_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock screen to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Load saved language
  final savedLanguage =
      await LocalStorageService().getSelectedLanguage() ?? 'Arabic';

  final savedLocale = savedLanguage == 'English'
      ? const Locale('en', 'US')
      : const Locale('ar');

  // Check if user is logged in
  final isLoggedIn = await LocalStorageService().isLoggedIn() ?? false;

  runApp(MyApp(savedLocale: savedLocale, isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final Locale savedLocale;
  final bool isLoggedIn;

  const MyApp({super.key, required this.savedLocale, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SplashViewModel()),
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ChangeNotifierProvider(create: (_) => CartViewModel()),
            ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: AppStrings(),
            locale: savedLocale,
            fallbackLocale: const Locale('en', 'US'),
            // Decide home screen based on login status
            home: isLoggedIn ? HomeScreen() : const SplashScreen(),
          ),
        );
      },
    );
  }
}
