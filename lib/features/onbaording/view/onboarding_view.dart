import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_x/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_store_app/core/widgets/custom_button.dart';
import 'package:mini_store_app/features/onbaording/view_model/onbaording_view_model.dart';
import 'package:provider/provider.dart';
import '../../auth/view/login_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int getLogicalIndex(int index, int totalPages) {
    if (Get.locale?.languageCode == 'ar') {
      return totalPages - 1 - index;
    }
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingViewModel>(
      builder: (context, provider, child) {
        final totalPages = provider.appStrings.onboardingData.length;
        return Directionality(
          textDirection: Get.locale?.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },

            child: Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 10.h),

                    // LANGUAGE SELECTOR
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: InkWell(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.language),
                              SizedBox(width: 5.w),
                              Text('language'.tr),
                            ],
                          ),
                          onTap: () {
                            showMenu(
                              context: context,
                              position: const RelativeRect.fromLTRB(
                                100,
                                100,
                                10,
                                10,
                              ),
                              items: [
                                const PopupMenuItem(
                                  value: 'English',
                                  child: Text('English'),
                                ),
                                const PopupMenuItem(
                                  value: 'Arabic',
                                  child: Text('العربية'),
                                ),
                              ],
                            ).then((selectedValue) async {
                              if (selectedValue != null) {
                                await provider.isLanguage(selectedValue);
                              }
                            });
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // APP TITLE
                    Text(
                      'stylish'.tr,
                      style: TextStyle(
                        fontSize: 20.sp,
                        letterSpacing: 5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 15.h),

                    // PAGEVIEW
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: totalPages,
                        reverse: Get.locale?.languageCode == 'ar',
                        onPageChanged: (index) {
                          provider.changeOnboardingPage(
                            getLogicalIndex(index, totalPages),
                          );
                        },
                        itemBuilder: (context, index) {
                          final displayIndex = getLogicalIndex(
                            index,
                            totalPages,
                          );
                          final data =
                              provider.appStrings.onboardingData[displayIndex];

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 50.h),
                                Image.asset(data['image']!, width: 180.w),
                                SizedBox(height: 30.h),
                                Text(
                                  data['titleKey']!.tr,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Text(
                                    data['subtitleKey']!.tr,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // DOT INDICATORS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(totalPages, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: provider.currentPage == index ? 20.w : 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: provider.currentPage == index
                                ? Colors.blue
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: 20.h),

                    // NEXT BUTTON
                    CustomButton1(
                      title: provider.currentPage == totalPages - 1
                          ? 'get_started'.tr
                          : 'next'.tr,
                      onTap: () {
                        if (provider.currentPage < totalPages - 1) {
                          int nextPage = Get.locale?.languageCode == 'ar'
                              ? totalPages - 1 - (provider.currentPage + 1)
                              : provider.currentPage + 1;

                          _pageController.animateToPage(
                            nextPage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Get.offAll(() => LoginScreen());
                        }
                      },
                    ),

                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
