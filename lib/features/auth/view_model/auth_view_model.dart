import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:mini_store_app/core/widgets/custom_snakbar.dart';
import 'package:mini_store_app/features/auth/view/auth_otp.dart';
import 'package:mini_store_app/features/home/view/home_view.dart';
import 'package:otp_text_field/otp_field.dart';
import '../../../core/services/local_storage_service.dart';

class AuthViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final OTPVerficationController = TextEditingController();
  final OtpFieldController otpController = OtpFieldController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  bool isPhoneLogin = false;
  bool isPasswordVisible = false;

  final GlobalKey<FormState> _formKeylogin = GlobalKey<FormState>();
  GlobalKey<FormState> get formKeySignIn => _formKeylogin;

  void passwordVisbility(bool value) {
    isPasswordVisible = value;
    notifyListeners();
  }

  String otpValue = "";
  bool _isLoading = false;

  String errorMessage = '';
  bool get isloading => _isLoading;
  bool get isloading2 => _isLoading2;
  bool _isLoading2 = false;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setLoading2(bool value) {
    _isLoading2 = value;
    notifyListeners();
  }

  ////  login with email and  password
  Future<bool> loginWithEmail(BuildContext context) async {
    try {
      setLoading(true);
      final email = emailController.text.toString();
      final password = passwordController.text.toString();

      await Future.delayed(const Duration(seconds: 2));
      if (email == "test@example.com" && password == "123456") {
        CustomSnackBar().showSnackbar("user_login_sucessfully".tr);
        await LocalStorageService().saveLogin();

        Get.offAll(() => HomeScreen());
        return true;
      } else {
        CustomSnackBar().snackbar(context, "user_invaild_account".tr);
      }

      return false;
    } catch (e) {
      CustomSnackBar().snackbar(context, "user_invaild_account".tr);
      return false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  //// login with phone number

  Future<bool> registerWithPhone(BuildContext, countryCode) async {
    final phone = phoneController.text.trim();
    final fullPhone = "$countryCode$phone";

    if (phone.isEmpty) {
      CustomSnackBar().showSnackbar(
        "please_enter_your_phone_number".tr,
        isError: true,
      );
      return false;
    }

    final phoneRegex = RegExp(r'^[0-9]{6,13}$');
    if (!phoneRegex.hasMatch(phone)) {
      CustomSnackBar().showSnackbar(
        "please_enter_valid_phone_number".tr,
        isError: true,
      );
      return false;
    }

    setLoading(true);
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 3));

      CustomSnackBar().showSnackbar(
        "otp_sent_to $fullPhone".tr,
        isError: false,
      );

      Get.to(() => OtpScreen());

      return true;
    } catch (e) {
      CustomSnackBar().showSnackbar(
        "failed_to_send_otp_please_try_again".tr,
        isError: true,
      );
      return false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  /////// auth OTP verfication

  Future<void> verifyOtp(BuildContext context) async {
    setLoading2(true);
    if (otpValue.length != 4) {
      CustomSnackBar().showSnackbar("please_enter_4_digit_otp".tr);
      await Future.delayed(const Duration(seconds: 1));
      setLoading2(false);
      return;
    }

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (otpValue == "0000") {
        await LocalStorageService().saveLogin();
        CustomSnackBar().showSnackbar("phone_number_verified_successfully".tr);

        setLoading2(false);
        Get.offAll(() => HomeScreen());
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (_) =>  HomeScreen()),
        // );
      } else {
        setLoading2(false);

        otpController.clear();
        otpValue = "";
        CustomSnackBar().snackbar(context, "invalid_otp".tr);
      }
    } catch (e) {
      setLoading2(false);

      CustomSnackBar().snackbar(context, "otp_verification_failed".tr);
    } finally {
      setLoading2(false);
    }
  }
}
