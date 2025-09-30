import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:healthcare_app/ui/home/home_view.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/utils/common_functions.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isPwdHidden = true.obs;

  void togglePassword() {
    isPwdHidden.value = !isPwdHidden.value;
  }

  ///// Login Logic
  void login() {
    String? error = fieldValidation();

    if (error != null) {
      CommonFunctions.flushBarErrorMessage(
        // title: "Error",
        msg: error,
        // color: AppColors.redColor,
      );
      return;
    }

    /// If validation passed
    CommonFunctions.flushBarSuccessMessage(
      //title: "Success",
      msg: "Login successful",
      // color: AppColors.onelightgreencolor,
    );

    // Navigate to main screen
    Get.off(() => HomeView());

    // Clear fields after login
    clearTextFields();
  }

  ///// Validation for email and password
  String? fieldValidation() {
    if (emailController.text.trim().isEmpty) {
      return 'Email is required.';
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      return 'Enter a valid email address.';
    } else if (passwordController.text.trim().isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  ///// Clear fields
  void clearTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }
}
