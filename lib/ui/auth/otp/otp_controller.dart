import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/auth/login/login_view.dart';
import 'package:healthcare_app/ui/utils/common_functions.dart';

class OtpController extends GetxController {
  final TextEditingController otpController = TextEditingController();

  /// Verify OTP Logic
  void verifyOtp() {
    String? error = validateOtp();

    /// If error → red flushbar message
    if (error != null) {
      CommonFunctions.flushBarErrorMessage(msg: error);
      return;
    }

    /// If OTP valid → success message
    CommonFunctions.flushBarSuccessMessage(msg: "OTP Verified Successfully!");

    /// Navigate to Login screen
    Get.offAll(() => const LoginView());

    otpController.clear();
  }

  /// OTP Validation
  String? validateOtp() {
    String otp = otpController.text.trim();

    if (otp.isEmpty) {
      return "Please enter the OTP.";
    } else if (otp.length != 6) {
      return "OTP must be 6 digits.";
    }
    return null;
  }
}
