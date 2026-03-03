import 'package:get_x/get_navigation/src/root/internacionalization.dart';

import 'app_assets.dart';

class AppStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      "home": "Home",
      "welcome_back": "Welcome Back!",
      "or": "OR",
      "forget_password": "Forget Password",
      "valid_email": "Enter a valid email",
      "login": "Login",
      "email": "Email",
      "verfication_screen": "OTP Verfication",
      "language": "Language",
      "password": "Password",
      "chooseProducts": "Choose Products",
      "chooseProductsDescription":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      "stylish": "Stylish",
      "next": "Next",

      "enter": "Enter",
      "get_started": "Get Started",
      // Onboarding
      "on1_title": "Choose Products",
      "phone_number": "Phone number",
      "on1_subtitle":
          "Browse our selection and pick the products you love. You can customize your choices and get started with your personalized experience.",
      "on2_title": "Make Payment",
      "on2_subtitle":
          "Securely complete your purchase in just a few steps. Choose your preferred payment method and confirm your order.",
      "on3_title": "Get Your Order",
      "invalid_otp": "Invalid OTP",
      "please_enter_valid_phone_number": "Please enter a valid phone number",
      "please_enter_your_phone_number": "Please enter your phone number",
      "user_invaild_account ": "User Invaild Account",
      "otp_sent_to": "OTP sent to",
      "enter_valid_email_and_password": "Enter valid email and password",
      "phone_number_verified_successfully":
          "Phone number verified successfully",
      "enter_email_password_or_phone_number":
          "Enter email/password or phone number",
      "please_enter_4_digit_otp": "Please enter 4 digit OTP",
      "failed_to_send_otp_please_try_again":
          "Failed to send OTP. Please try again.",
      "user_login_sucessfully": "User Login Sucessfully",
      "otp_verification_failed": "OTP verification failed",
      "submit": "Submit",
      'add_to_cart': "Add to Cart",
      "item_already_in_cart": "Item Already Available",
      "dashboard": "Dashboard",
      "your_cart_is_empty": "Your cart is empty",
      "added_to_the_cart": "Added to the cart",
      "product_details": "Product Details",
      "on3_subtitle":
          "Track your order and receive updates in real-time. Sit back and relax while we deliver your products right to your door.",
    },
    'ar': {
      "your_cart_is_empty": "سلة التسوق الخاصة بك فارغة",
      "add_to_cart": "إضافة إلى السلة",
      "added_to_the_cart": "تمت الإضافة إلى السلة",
      "product_details": "فاصيل المنتج",
      "dashboard": "لوحة التحكم",
      "submit": "إرسال",
      "item_already_in_cart": "العنصر موجود بالفعل",
      "verfication_screen": "رمز التحقق",
      "enter_valid_email_and_password":
          "يرجى إدخال بريد إلكتروني وكلمة مرور صالحين",
      "invalid_otp": "رمز التحقق غير صالح",
      "home": "الرئيسية",
      "enter_email_password_or_phone_number":
          "يرجى إدخال البريد الإلكتروني/كلمة المرور أو رقم الهاتف",
      "otp_verification_failed": "فشل التحقق من رمز التحقق",
      "phone_number_verified_successfully": "تم التحقق من رقم الهاتف بنجاح",
      "please_enter_4_digit_otp": "يرجى إدخال رمز التحقق المكون من 4 أرقام",
      "failed_to_send_otp_please_try_again":
          "فشل في إرسال رمز التحقق. الرجاء المحاولة مرة أخرى.",
      "otp_sent_to": "تم إرسال رمز التحقق إلى",
      "user_login_sucessfully": "تم تسجيل دخول المستخدم بنجاح",
      "or": "أو",
      "please_enter_valid_phone_number": "يرجى إدخال رقم هاتف صالح",
      "please_enter_your_phone_number": "يرجى إدخال رقم هاتفك",
      "user_invaild_account": "حساب المستخدم غير صالح",
      "phone_number": "رقم الهاتف",
      "language": "اللغة",
      "forget_password": "نسيت كلمة المرور",
      "enter": "دخول",
      "valid_email": "أدخل بريد إلكتروني صحيح",
      "login": "تسجيل الدخول",
      "welcome_back": "مرحبًا بعودتك!",
      "email": "البريد الإلكتروني",
      "password": "كلمة المرور",
      "chooseProducts": "اختر المنتجات",
      "chooseProductsDescription":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      "stylish": "أنيق",
      "next": "التالي",
      "get_started": "ابدأ الآن",
      // Onboarding
      "on1_title": "اختر المنتجات",
      "on1_subtitle":
          "تصفح مجموعتنا واختر المنتجات التي تحبها. يمكنك تخصيص اختياراتك والبدء بتجربتك الشخصية.",
      "on2_title": "قم بالدفع",
      "on2_subtitle":
          "أكمل عملية الشراء بأمان في بضع خطوات فقط. اختر طريقة الدفع المفضلة لديك وقم بتأكيد طلبك.",
      "on3_title": "استلم طلبك",
      "on3_subtitle":
          "تتبع طلبك واستقبل التحديثات في الوقت الفعلي. اجلس واسترخ بينما نقوم بتوصيل منتجاتك إلى بابك.",
    },
  };

  // Onboarding images + translation keys
  final List<Map<String, String>> onboardingData = [
    {
      'image': AppAssets().on1,
      'titleKey': 'on1_title',
      'subtitleKey': 'on1_subtitle',
    },
    {
      'image': AppAssets().on2,
      'titleKey': 'on2_title',
      'subtitleKey': 'on2_subtitle',
    },
    {
      'image': AppAssets().on3,
      'titleKey': 'on3_title',
      'subtitleKey': 'on3_subtitle',
    },
  ];
}
