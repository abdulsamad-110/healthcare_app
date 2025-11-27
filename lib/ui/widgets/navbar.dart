import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/ui/auth/login/login_view.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/utils/image_constants.dart';
import 'package:healthcare_app/ui/widgets/mycustom_button.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          ///// Header Section
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(color: AppColors.accentColor),
            accountName: Text(
              'Abdul Razaq Ferozi',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              'support@ferozipharmacy.com',
              style: TextStyle(
                color: AppColors.whiteColor.withOpacity(0.9),
                fontSize: 14.sp,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                ImageConstants.authlogo,
                height: 80.h,
                width: 80.w,
              ),
            ),
          ),

          ///// Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.login,
                    color: AppColors.accentColor,
                  ),
                  title: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Get.to(() => LoginView());
                  },
                ),
                Divider(color: Colors.grey.shade300, thickness: 1),

                ListTile(
                  leading: const Icon(
                    Icons.calendar_today,
                    color: AppColors.accentColor,
                  ),
                  title: Text(
                    'Appointments',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Get.to(() => AppointmentView());
                  },
                ),
                Divider(color: Colors.grey.shade300, thickness: 1),

                ListTile(
                  leading: const Icon(
                    Icons.local_pharmacy,
                    color: AppColors.accentColor,
                  ),
                  title: Text(
                    'Our Services',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Get.to(() => ServicesView());
                  },
                ),
                Divider(color: Colors.grey.shade300, thickness: 1),

                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: AppColors.accentColor,
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Get.to(() => ProfileView());
                  },
                ),
                Divider(color: Colors.grey.shade300, thickness: 1),

                ListTile(
                  leading: const Icon(Icons.info, color: AppColors.accentColor),
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Get.to(() => AboutUsView());
                  },
                ),
                Divider(color: Colors.grey.shade300, thickness: 1),

                ///// Logout with BottomSheet
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () {
                    Get.back(); // Drawer close
                    Get.bottomSheet(
                      Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Top Drag Handle
                            Container(
                              width: 50.w,
                              height: 5.h,
                              margin: EdgeInsets.only(bottom: 20.h),
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                  size: 30.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10.h),
                            Text(
                              "Are you sure you want to logout?",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 35.h),

                            ///// Custom Buttons Row with MycustomButton
                            Row(
                              children: [
                                Expanded(
                                  child: MycustomButton(
                                    backgroundColor: Colors.grey.shade300,
                                    height: 42.h,
                                    width: double.infinity,
                                    title: "Cancel",
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: MycustomButton(
                                    backgroundColor: AppColors.accentColor,
                                    height: 42.h,
                                    width: double.infinity,
                                    title: "Logout",
                                    onPressed: () {
                                      Get.back();
                                      // logout logic
                                      Get.offAll(() => LoginView());
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                      isScrollControlled: true, // Height zyada lene k liye
                    );
                  },
                ),
              ],
            ),
          ),

          ///// Footer
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(
              "© 2025 Ferozi Pharmacy\nAll rights reserved.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }
}
