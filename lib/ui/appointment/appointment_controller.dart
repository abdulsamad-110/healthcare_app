import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/ui/appointment_success/appointment_success_view.dart';
import 'package:healthcare_app/ui/utils/common_functions.dart';

class AppointmentController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();

  /// Selected Time
  var selectedTime = "".obs;

  /// Select Time
  void selectTime(String time) {
    selectedTime.value = time;
  }

  /// Validation
  bool validateForm() {
    if (dateController.text.isEmpty) {
      CommonFunctions.flushBarErrorMessage(msg: "Please select a date");
      return false;
    } else if (selectedTime.value.isEmpty) {
      CommonFunctions.flushBarErrorMessage(msg: "Please select a time");
      return false;
    } else if (nameController.text.isEmpty) {
      CommonFunctions.flushBarErrorMessage(msg: "Please enter patient name");
      return false;
    } else if (phoneController.text.isEmpty) {
      CommonFunctions.flushBarErrorMessage(msg: "Please enter phone number");
      return false;
    }
    return true;
  }

  /// Submit Appointment
  void submitAppointment() {
    if (validateForm()) {
      // Optionally show success message
      CommonFunctions.flushBarSuccessMessage(
        msg: "Appointment booked successfully",
      );

      Get.to(() => const AppointmentSuccessView());
    }
  }
}
