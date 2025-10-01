import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/utils/text_style.dart';

class CommonFunctions {
  ///// Show Custom GetX SnackBar
  static showMessage({
    required String title,
    required String msg,
    required Color color,
  }) {
    return Get.snackbar(
      title,
      msg,
      backgroundColor: color,
      colorText: AppColors.whiteColor,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
    );
  }

  /// Flutter’s default SnackBar (simple, no icon)
  static customSnackBar({required String msg, required Color color}) {
    return SnackBar(
      content: Text(
        msg,
        style: AppTextStyles.popLight15.copyWith(
          color: AppColors.whiteColor,
          fontSize: 16,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  ///// Flushbar Success Message
  static flushBarSuccessMessage({required String msg}) {
    Future.delayed(const Duration(milliseconds: 100), () {
      Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: EdgeInsets.all(15.r),
        message: msg,
        messageColor: AppColors.whiteColor,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: AppColors.onelightgreencolor,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        borderRadius: BorderRadius.circular(12.r),
        icon: Icon(Icons.check_circle, size: 20.r, color: AppColors.whiteColor),
      ).show(Get.context!);
    });
  }

  ///// Flushbar Error Message
  static flushBarErrorMessage({required String msg, int duration = 3}) {
    Future.delayed(const Duration(milliseconds: 100), () {
      Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: EdgeInsets.all(15.r),
        message: msg,
        messageColor: AppColors.whiteColor,
        duration: Duration(seconds: duration),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: AppColors.redColor,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        borderRadius: BorderRadius.circular(12.r),
        icon: Icon(
          Icons.error_outline,
          size: 20.r,
          color: AppColors.whiteColor,
        ),
      ).show(Get.context!);
    });
  }

  ///// Auth Navigation Check
  // static onAuthStateChange() {
  //   if (LocalStorage.getString(LocalStorageKeys.accessTokenKey) != null) {
  //     return;
  //     //NavigationView();
  //   } else {
  //     return;
  //     //SigninView();
  //   }
  // }
}
