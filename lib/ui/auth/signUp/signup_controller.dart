import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:healthcare_app/ui/auth/login/login_view.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/utils/common_functions.dart';

class SignupController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isPwdHidden = true.obs;

  void togglePassword() {
    isPwdHidden.value = !isPwdHidden.value;
  }

  ///// Sign Up Logic
  void signUp() {
    String? error = fieldValidation();
    if (error != null) {
      CommonFunctions.flushBarErrorMessage(
        //title: "Error",
        msg: error,
        // color: AppColors.redColor,
      );
      return;
    }

    CommonFunctions.flushBarSuccessMessage(
      // title: "Success",
      msg: "Registration successful",
      // color: AppColors.onelightgreencolor,
    );

    // Navigate to Login Screen
    Get.off(() => const LoginView());

    // Clear all fields
    clearTextFields();
  }

  ///// Validation
  String? fieldValidation() {
    if (firstNameController.text.isEmpty) {
      return 'First Name is Required.';
    } else if (lastNameController.text.isEmpty) {
      return 'Last Name is Required.';
    } else if (phoneController.text.isEmpty) {
      return 'Phone Number is Required.';
    } else if (emailController.text.isEmpty) {
      return 'Email is Required.';
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      return 'Enter a valid email address';
    } else if (passwordController.text.isEmpty) {
      return 'Password is Required.';
    }
    return null;
  }

  ///// Clear fields
  void clearTextFields() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
  }

  // @override
  // void onClose() {
  //   clearTextFields();
  //   firstNameController.dispose();
  //   lastNameController.dispose();
  //   phoneController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }
}
