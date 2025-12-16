import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/auth/login/login_view.dart';
import 'package:healthcare_app/ui/utils/common_functions.dart';

class ChangePasswordController extends GetxController {
  /// Controllers
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  /// Visibility
  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPassword() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  /// Submit Password
  void submitPassword() {
    String? error = validatePassword();

    /// Error case
    if (error != null) {
      CommonFunctions.flushBarErrorMessage(msg: error);
      return;
    }

    /// Success case
    CommonFunctions.flushBarSuccessMessage(
      msg: "Password changed successfully!",
    );

    /// Navigate to Login
    Get.offAll(() => const LoginView());

    /// Clear fields
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  /// Validation logic (same style as OTP)
  String? validatePassword() {
    final newPass = newPasswordController.text.trim();
    final confirmPass = confirmPasswordController.text.trim();

    if (newPass.isEmpty) {
      return "Please enter new password.";
    } else if (newPass.length < 6) {
      return "Password must be at least 6 characters.";
    } else if (confirmPass.isEmpty) {
      return "Please confirm your password.";
    } else if (newPass != confirmPass) {
      return "Passwords do not match.";
    }
    return null;
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
