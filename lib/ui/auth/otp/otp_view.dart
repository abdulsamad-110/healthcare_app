import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/auth/otp/otp_controller.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/utils/image_constants.dart';
import 'package:healthcare_app/ui/widgets/mycustom_button.dart';
import 'package:healthcare_app/ui/widgets/mycustom_textfield.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4DD0E1),
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25.sp,
            color: AppColors.blackColor,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4DD0E1), Color(0xFFE0F7FA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container(
                //   height: 110.w, // responsive size
                //   width: 110.w,
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.white,
                //         blurRadius: 1,
                //         offset: Offset(0, 0),
                //       ),
                //     ],
                //   ),
                //   child: ClipOval(
                //     child: Image.asset(
                //       ImageConstants.authlogo,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Image.asset(ImageConstants.authlogo, height: 100.h),
                SizedBox(height: 20.h),
                Text(
                  "Email Verification",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  "Enter the 6-digit OTP sent to your email address.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 30.h),

                /// Email
                // CustomTextField(
                //   controller: controller.emailController,
                //   // isBorder: true,
                //   hintText: "example@gmail.com",
                //   titleText: "Email",
                // ),
                Pinput(
                  length: 6,
                  controller: controller.otpController,
                  defaultPinTheme: PinTheme(
                    width: 46.w,
                    height: 52.h,
                    textStyle: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      // border: Border.all(
                      //   // color: AppColors.blackColor.withOpacity(0.3),
                      // ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onCompleted: (pin) => debugPrint('Completed: $pin'),
                ),
                SizedBox(height: 24.h),

                /// Submit Button
                MycustomButton(
                  backgroundColor: AppColors.accentColor,
                  height: 48.h,
                  width: 315.w,
                  title: "Verify",
                  onPressed: () {
                    controller.verifyOtp();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
