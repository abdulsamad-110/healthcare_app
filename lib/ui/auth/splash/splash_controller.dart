import 'package:get/get.dart';
import 'package:healthcare_app/ui/auth/login/login_view.dart';
import 'dart:async';

import 'package:healthcare_app/ui/home/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // 3 sec delay, phir next screen par navigate kare
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => LoginView());
    });
  }
}
