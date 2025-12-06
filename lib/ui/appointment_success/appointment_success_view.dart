import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/home/home_view.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/widgets/mycustom_button.dart';
import 'package:http/http.dart';

class AppointmentSuccessView extends StatelessWidget {
  const AppointmentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 100, color: Colors.green),
              const SizedBox(height: 20),
              const Text(
                "Appointment Confirmed!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your appointment has been successfully booked.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),
              MycustomButton(
                backgroundColor: AppColors.accentColor,
                title: "Go to Home",
                onPressed: () => Get.off(() => HomeView()),

                // Get.offAllNamed('/home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
