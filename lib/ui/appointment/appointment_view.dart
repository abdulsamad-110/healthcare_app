import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/widgets/mycustom_button.dart';
import 'package:healthcare_app/ui/widgets/mycustom_textfield.dart';
import 'appointment_controller.dart';

class AppointmentView extends StatelessWidget {
  final String doctorName;

  const AppointmentView({super.key, required this.doctorName});

  @override
  Widget build(BuildContext context) {
    final AppointmentController controller = Get.put(AppointmentController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: const Text("Book Appointment"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),

            /// Doctor Name
            Text(
              "Doctor",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 6.h),
            Text(
              doctorName,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),

            SizedBox(height: 30.h),

            /// Date Picker
            GestureDetector(
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );

                if (pickedDate != null) {
                  controller.dateController.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                }
              },
              child: AbsorbPointer(
                child: CustomTextField(
                  controller: controller.dateController,
                  titleText: "Select Date",
                  hintText: "Choose appointment date",
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            /// Time Slots
            Text(
              "Select Time",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _timeBox("09:00 AM", controller),
                _timeBox("10:00 AM", controller),
                _timeBox("11:00 AM", controller),
                _timeBox("12:00 PM", controller),
              ],
            ),

            SizedBox(height: 30.h),

            /// Patient Name
            CustomTextField(
              controller: controller.nameController,
              titleText: "Patient Name",
              hintText: "Enter your name",
            ),

            SizedBox(height: 20.h),

            /// Phone Number
            CustomTextField(
              controller: controller.phoneController,
              titleText: "Phone Number",
              hintText: "03XXXXXXXXX",
              keyboardType: TextInputType.phone,
            ),

            SizedBox(height: 40.h),

            /// Confirm Button
            MycustomButton(
              backgroundColor: AppColors.accentColor,
              height: 48.h,
              width: double.infinity,
              title: "Confirm Appointment",
              onPressed: controller.submitAppointment,
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  /// Time Box with Selection Highlight
  Widget _timeBox(String time, AppointmentController controller) {
    return GestureDetector(
      onTap: () => controller.selectTime(time),
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: controller.selectedTime.value == time
                ? AppColors.accentColor
                : Colors.transparent,
            border: Border.all(color: AppColors.accentColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            time,
            style: TextStyle(
              color: controller.selectedTime.value == time
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
