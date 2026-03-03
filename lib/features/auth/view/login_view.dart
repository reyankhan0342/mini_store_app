import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_x/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_store_app/core/%20constants/app_assets.dart';
import 'package:mini_store_app/core/widgets/customTextField.dart';
import 'package:mini_store_app/core/widgets/custom_button.dart';
import 'package:mini_store_app/core/widgets/custom_snakbar.dart';
import 'package:provider/provider.dart';
import '../view_model/auth_view_model.dart';
import '../../home/view/home_view.dart';
import 'package:country_code_picker/country_code_picker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String countryCode = "+966";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scrrenHeight = MediaQuery.of(context).size.height;
    return Consumer<AuthViewModel>(
      builder: (BuildContext context, value, Widget? child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SingleChildScrollView(
                child: Form(
                  key: value.formKeySignIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'welcome_back'.tr,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),

                      Container(
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Image.asset(AppAssets().splash),
                          ),
                        ),
                      ),

                      SizedBox(height: 40.h),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            AuthCustomTextfield(
                              hintText: 'email'.tr,
                              keyboardType: TextInputType.emailAddress,
                              prefcon: Icons.person,
                              controller: value.emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email is requred ".tr;
                                }
                              },
                              onChanged: (_) {
                                value.phoneController.clear();
                              },
                            ),

                            SizedBox(height: 20.h),

                            AuthCustomTextfield(
                              hintText: 'password'.tr,
                              prefcon: Icons.lock,
                              controller: value.passwordController,
                              obscureText: value.isPasswordVisible,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIc: value.isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              visibility: () => {
                                value..passwordVisbility(
                                  value.isPasswordVisible =
                                      !value.isPasswordVisible,
                                ),
                              },
                              onChanged: (_) {
                                value.phoneController.clear();
                              },

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }

                                return null;
                              },
                            ),

                            SizedBox(height: 7),

                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'forget_password'.tr,

                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: 11.sp,
                                    decorationColor: Colors.black,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20.h),

                            Container(
                              width: screenWidth,
                              height: 2,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),

                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.34,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 5.h),
                                Text(
                                  'or'.tr,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5.h),
                                Container(
                                  width: screenWidth * 0.34,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            CountryCodePicker(
                              initialSelection: 'SA',
                              favorite: const ['+966', 'SA'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              onChanged: (code) {
                                countryCode = code.dialCode ?? "+966";
                              },
                            ),

                            // Divider
                            Container(
                              height: 30,
                              width: 1,
                              color: Colors.grey.shade300,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                            ),

                            // Phone Field
                            Expanded(
                              child: Container(
                                child: TextField(
                                  maxLength: 11,

                                  controller: value.phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintText: 'phone_number'.tr,

                                    border: InputBorder
                                        .none, // remove default border
                                  ),
                                  onChanged: (_) {
                                    value.emailController.clear();
                                    value.passwordController.clear();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 40.h),

                      SizedBox(
                        width: screenWidth * 0.8,
                        height: 50.h,
                        child: CustomButton1(
                          loading: value.isloading,
                          onTap: () async {
                            final provider = value;

                            if (provider.emailController.text
                                    .trim()
                                    .isNotEmpty &&
                                provider.passwordController.text
                                    .trim()
                                    .isNotEmpty) {
                              if (provider.formKeySignIn.currentState!
                                  .validate()) {
                                await provider.loginWithEmail(context);
                              } else {
                                CustomSnackBar().snackbar(
                                  context,
                                  'enter_valid_email_and_password'.tr,
                                );
                              }
                              return;
                            } else if (provider.phoneController.text
                                .trim()
                                .isNotEmpty) {
                              bool otpSent = await provider.registerWithPhone(
                                context,
                                countryCode,
                              );

                              return;
                            } else {
                              CustomSnackBar().snackbar(
                                context,
                                'enter_email_password_or_phone_number'.tr,
                              );
                            }
                          },
                          title: 'enter'.tr,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
