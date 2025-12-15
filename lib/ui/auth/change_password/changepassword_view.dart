import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/auth/change_password/changepassword_controller.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/utils/image_constants.dart';
import 'package:healthcare_app/ui/widgets/mycustom_button.dart';
import 'package:healthcare_app/ui/widgets/mycustom_textfield.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController controller = Get.put(
      ChangePasswordController(),
    );

    return Scaffold(
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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Image.asset(ImageConstants.authlogo, height: 100.h),
                  SizedBox(height: 15.h),

                  // Title
                  Text(
                    "Change Password",
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  // Subtitle
                  Text(
                    "Create a new password for your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // New Password
                  Obx(
                    () => CustomTextField(
                      controller: controller.newPasswordController,
                      titleText: "New Password",
                      hintText: "********",
                      obscureText: controller.isPasswordHidden.value,
                      suffixIcon: IconButton(
                        onPressed: controller.togglePassword,
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Confirm Password
                  Obx(
                    () => CustomTextField(
                      controller: controller.confirmPasswordController,
                      titleText: "Confirm Password",
                      hintText: "********",
                      obscureText: controller.isConfirmPasswordHidden.value,
                      suffixIcon: IconButton(
                        onPressed: controller.toggleConfirmPassword,
                        icon: Icon(
                          controller.isConfirmPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // Submit Button
                  MycustomButton(
                    title: "Change Password",
                    height: 48.h,
                    width: 315.w,
                    backgroundColor: AppColors.accentColor,
                    onPressed: controller.submitPassword,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
