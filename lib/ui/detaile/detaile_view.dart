import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/widgets/mycustom_button.dart';

class DetaileView extends StatelessWidget {
  final String doctorName;
  final String category;
  final double rating;
  final int reviews;

  const DetaileView({
    super.key,
    required this.doctorName,
    required this.category,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top gradient background with app name
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4DD0E1), Color(0xFFE0F7FA)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  // App name
                  Text(
                    "Ferozi Pharmacy",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Doctor avatar
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: AppColors.accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Back button
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.blackColor,
                size: 25,
              ),
            ),
          ),

          // White container with details
          Positioned(
            top: MediaQuery.of(context).size.height * 0.38,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Name + Category
                  Text(
                    doctorName,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Rating Row
                  Row(
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: index < rating.round()
                                ? Colors.amber
                                : Colors.grey.shade300,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "$rating ($reviews Reviews)",
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // About Section
                  // About Section
                  Text(
                    "About Doctor",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "$doctorName has over 10 years of experience in treating patients. "
                    "They are highly skilled and passionate about providing the best care to patients.",
                    style: TextStyle(
                      color: Colors.black54,
                      height: 1.5,
                      fontSize: 14.sp,
                    ),
                  ),

                  const Spacer(),

                  // Appointment button
                  MycustomButton(
                    backgroundColor: AppColors.accentColor,
                    title: "Make Appointment",
                    onPressed: () {},
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
