import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_x/get_utils/src/extensions/internacionalization.dart';
import 'package:mini_store_app/core/%20constants/app_assets.dart'
    show AppAssets;
import 'package:mini_store_app/core/widgets/custom_button.dart';
import 'package:mini_store_app/features/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../home/view/home_view.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final vm = Provider.of<AuthViewModel>(context);

    return Consumer<AuthViewModel>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("verfication_screen".tr),
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                          AppAssets().splash,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),

                  OTPTextField(
                    controller: value.otpController,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 65.w,
                    keyboardType: TextInputType.number,
                    textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 12.r,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.grey.shade100,
                      borderColor: Colors.grey.shade300,
                      focusBorderColor: Colors.blue,
                      enabledBorderColor: Colors.grey.shade300,
                      disabledBorderColor: Colors.grey.shade200,
                    ),
                    onChanged: (pin) {
                      value.otpValue = pin;
                    },
                    onCompleted: (pin) {
                      value.otpValue = pin;
                    },
                  ),
                  SizedBox(height: 150.h),

                  // Custom Button
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: CustomButton1(
                      loading: value.isloading2,
                      title: "submit".tr,
                      onTap: () async {
                        await value.verifyOtp(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
