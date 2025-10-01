import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:healthcare_app/ui/auth/login/login_view.dart';
import 'package:healthcare_app/ui/utils/common_functions.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  /// Submit logic
  void submit() {
    String? error = fieldValidation();

    if (error != null) {
      CommonFunctions.flushBarErrorMessage(msg: error);
      return;
    }

    /// If validation passed
    CommonFunctions.flushBarSuccessMessage(
      msg: "Verification link sent to your email!",
    );

    /// TODO: Navigate to OTP screen if required
    Get.to(() => LoginView());

    clearTextFields();
  }

  /// Validation
  String? fieldValidation() {
    if (emailController.text.trim().isEmpty) {
      return 'Email is required.';
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      return 'Enter a valid email address.';
    }
    return null;
  }

  /// Clear field
  void clearTextFields() {
    emailController.clear();
  }
}
