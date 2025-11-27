import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/auth/forgot_password/forgot_password_view.dart';
import 'package:healthcare_app/ui/auth/login/login_controller.dart';
import 'package:healthcare_app/ui/auth/signUp/signup_view.dart';
import 'package:healthcare_app/ui/home/home_view.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/utils/image_constants.dart';
import 'package:healthcare_app/ui/widgets/mycustom_button.dart';
import 'package:healthcare_app/ui/widgets/mycustom_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4DD0E1), // Teal blue top
              Color(0xFFE0F7FA), // Light background
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            // 👈 sab content center ho jayega
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min, // content jitna ho utna hi lega
                children: [
                  Image.asset(ImageConstants.authlogo, height: 100.h),

                  SizedBox(height: 10.h),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),

                  /// Description text 👇
                  Text(
                    "Login to continue with Ferozi Pharmacy.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 30.h),

                  /// Email Field
                  CustomTextField(
                    controller: controller.emailController,
                    hintText: "example@gmail.com",
                    titleText: 'Email',
                    //isBorder: true,
                  ),

                  SizedBox(height: 20.h),

                  /// Password Field
                  /// Password Field with toggle
                  Obx(
                    () => CustomTextField(
                      controller: controller.passwordController,
                      // isBorder: true,
                      obscureText: controller.isPwdHidden.value,
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
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
                  SizedBox(height: 6.h),

                  /// Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // TODO: Forgot password logic
                        Get.to(() => const ForgotPasswordView());
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.greeycolor,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20.h),
                  SizedBox(height: 16.h),

                  /// Login Button
                  MycustomButton(
                    backgroundColor: AppColors.accentColor,
                    height: 48.h,
                    width: 315.w,
                    title: "Login",
                    onPressed: controller.login,
                  ),

                  SizedBox(height: 20.h),

                  /// Divider with text
                  /// Divider with text
                  SizedBox(
                    width: 315.w, // 👈 button ke barabar width
                    child: Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// Sign Up Option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                      SizedBox(width: 5.w),
                      InkWell(
                        onTap: () => Get.to(() => const SignupView()),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ),
                    ],
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
