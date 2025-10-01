import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:healthcare_app/ui/home/home_controller.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Category",
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        const Spacer(),

        // Children Button
        GestureDetector(
          onTap: () => controller.selectChildren(),
          child: Obx(
            () => Container(
              height: 30.h,
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: controller.isAdult.value
                    ? Colors
                          .grey
                          .shade300 // not selected
                    : AppColors.accentColor, // selected
              ),
              child: Center(
                child: Text(
                  "Children",
                  style: TextStyle(
                    color: controller.isAdult.value
                        ? Colors.black
                        : AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),

        // Adult Button
        GestureDetector(
          onTap: () => controller.selectAdult(),
          child: Obx(
            () => Container(
              height: 30.h,
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: controller.isAdult.value
                    ? AppColors
                          .accentColor // selected
                    : Colors.grey.shade300, // not selected
              ),
              child: Center(
                child: Text(
                  "Adult",
                  style: TextStyle(
                    color: controller.isAdult.value
                        ? AppColors.whiteColor
                        : Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
