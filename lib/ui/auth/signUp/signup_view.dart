import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/auth/login/login_view.dart';
import 'package:healthcare_app/ui/auth/signUp/signup_controller.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/utils/image_constants.dart';
import 'package:healthcare_app/ui/widgets/mycustom_button.dart';
import 'package:healthcare_app/ui/widgets/mycustom_textfield.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Container(
                  //   height: 110.h,
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
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                  Text(
                    "Sign up to continue with Ferozi Pharmacy.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),

                  /// First Name
                  CustomTextField(
                    controller: controller.firstNameController,
                    //isBorder: true,
                    borderColor: AppColors.blackColor,
                    hintText: 'Enter your first name',
                    titleText: 'First Name',
                  ),
                  SizedBox(height: 12.h),

                  /// Last Name
                  CustomTextField(
                    controller: controller.lastNameController,
                    // isBorder: true,
                    hintText: 'Enter your last name',
                    titleText: 'Last Name',
                  ),
                  SizedBox(height: 12.h),

                  /// Phone Number
                  CustomTextField(
                    controller: controller.phoneController,
                    // isBorder: true,
                    hintText: '+1 515 513XXXX',
                    titleText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 12.h),

                  /// Email
                  CustomTextField(
                    controller: controller.emailController,
                    // isBorder: true,
                    hintText: "example@gmail.com",
                    titleText: "Email",
                  ),
                  SizedBox(height: 12.h),

                  /// Password
                  Obx(
                    () => CustomTextField(
                      controller: controller.passwordController,
                      // isBorder: true,
                      obscureText: controller.isPwdHidden.value,
                      suffixIcon: IconButton(
                        onPressed: controller.togglePassword,
                        icon: Icon(
                          controller.isPwdHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20.sp,
                        ),
                      ),
                      hintText: "********",
                      titleText: "Password",
                    ),
                  ),
                  SizedBox(height: 24.h),

                  /// Submit Button
                  MycustomButton(
                    backgroundColor: AppColors.accentColor,
                    height: 48.h,
                    width: 315.w,
                    title: "Submit",
                    onPressed: controller.signUp,
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
