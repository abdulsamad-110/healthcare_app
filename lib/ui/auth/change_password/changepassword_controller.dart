import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/auth/login/login_view.dart';
import 'package:healthcare_app/ui/utils/common_functions.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Correct RxBools
  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;

  // Toggle new password visibility
  void togglePassword() => isPasswordHidden.value = !isPasswordHidden.value;

  // Toggle confirm password visibility
  void toggleConfirmPassword() =>
      isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;

  // Submit password
  void submitPassword() {
    String newPwd = newPasswordController.text.trim();
    String confirmPwd = confirmPasswordController.text.trim();

    if (newPwd.isEmpty || confirmPwd.isEmpty) {
      CommonFunctions.flushBarErrorMessage(msg: "All fields are required");
      return;
    }

    if (newPwd != confirmPwd) {
      CommonFunctions.flushBarErrorMessage(msg: "Passwords do not match");
      return;
    }

    CommonFunctions.flushBarSuccessMessage(
      msg: "Password changed successfully",
    );

    // Clear fields
    newPasswordController.clear();
    confirmPasswordController.clear();

    // Navigate to login
    Get.offAll(() => const LoginView());
  }
}
