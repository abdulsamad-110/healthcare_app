import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/home/home_controller.dart';
import 'package:healthcare_app/ui/home/widgets/category_widget.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/widgets/category_card.dart';
import 'package:healthcare_app/ui/widgets/custom_searchbar.dart';
import 'package:healthcare_app/ui/widgets/rated_card.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Ferozi Pharmacy",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.accentColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.accentColor, size: 28.sp),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: AppColors.accentColor, size: 28.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE0F7FA), Color(0xFFFFFFFF)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),

                Text(
                  "Choose Your Doctor",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20.h),

                const CustomSearchBar(),
                SizedBox(height: 20.h),

                // Adult/Children Toggle Buttons
                // Category Row
                Row(
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),

                    // Children Button
                    Obx(
                      () => GestureDetector(
                        onTap: () => controller.selectChildren(),
                        child: Container(
                          height: 35.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: controller.isAdult.value
                                ? AppColors.whiteColor
                                : AppColors.accentColor, // selected
                            boxShadow: [
                              if (!controller.isAdult.value)
                                BoxShadow(
                                  color: AppColors.accentColor.withOpacity(0.4),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                            ],
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
                    SizedBox(width: 12.w),

                    // Adult Button
                    Obx(
                      () => GestureDetector(
                        onTap: () => controller.selectAdult(),
                        child: Container(
                          height: 35.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: controller.isAdult.value
                                ? AppColors
                                      .accentColor // selected
                                : AppColors.whiteColor,
                            boxShadow: [
                              if (controller.isAdult.value)
                                BoxShadow(
                                  color: AppColors.accentColor.withOpacity(0.4),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                            ],
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
                ),

                SizedBox(height: 20.h),

                ///// Categories
                Obx(
                  () => SizedBox(
                    height: 120.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none, // shadow cut na ho
                      itemCount: controller.activeCategories.length,
                      separatorBuilder: (_, __) => SizedBox(width: 12.w),
                      itemBuilder: (_, index) {
                        final category = controller.activeCategories[index];
                        return CategoryCard(
                          title: category['title']!,
                          icon: category['icon'] as IconData,
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // Doctors
                Text(
                  'Available Doctors',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),

                Expanded(
                  child: Obx(
                    () => ListView.separated(
                      itemCount: controller.activeDoctors.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (_, index) {
                        final doctor = controller.activeDoctors[index];
                        return RatedCard(
                          doctorName: doctor['name'],
                          category: doctor['category'],
                          rating: doctor['rating'],
                          reviews: doctor['reviews'],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
