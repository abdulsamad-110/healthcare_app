import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/detaile/detaile_view.dart';
import 'package:healthcare_app/ui/widgets/mycustom_button.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  // Categories
  final List<Map<String, dynamic>> categories = [
    {"title": "Cardiology", "icon": Icons.favorite},
    {"title": "Neurology", "icon": Icons.psychology},
    {"title": "Dentistry", "icon": Icons.medical_services},
    {"title": "Orthopedics", "icon": Icons.accessibility_new},
    {"title": "Dermatology", "icon": Icons.face_retouching_natural},
  ];

  // Doctors data
  final List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Sarah Ali",
      "category": "Cardiologist",
      "rating": 4.8,
      "reviews": 120,
    },
    {
      "name": "Dr. Ahmed Khan",
      "category": "Neurologist",
      "rating": 4.5,
      "reviews": 95,
    },
    {
      "name": "Dr. Ayesha Malik",
      "category": "Dermatologist",
      "rating": 4.7,
      "reviews": 110,
    },
    {
      "name": "Dr. Bilal Shaikh",
      "category": "Dentist",
      "rating": 4.4,
      "reviews": 80,
    },
  ];

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE0F7FA), // Soft light blue
              Color(0xFFFFFFFF), // Fade to white
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top icons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Icon(Icons.menu, size: 28.sp, color: AppColors.accentColor),
                //     Icon(
                //       Icons.person,
                //       size: 28.sp,
                //       color: AppColors.accentColor,
                //     ),
                //   ],
                // ),
                SizedBox(height: 12.h),

                // Title
                Text(
                  "Choose Your Doctor",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20.h),

                // Search Box
                const CustomSearchBar(),
                SizedBox(height: 20.h),

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
                    Text("Children", style: TextStyle(fontSize: 18.sp)),
                    SizedBox(width: 10.w),
                    Container(
                      height: 25.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: AppColors.accentColor,
                      ),
                      child: Center(
                        child: Text(
                          "Adult",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                // Horizontal Scrollable Categories
                SizedBox(
                  height: 100.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (_, index) {
                      final category = categories[index];
                      return CategoryCard(
                        title: category['title']!,
                        icon: category['icon'] as IconData,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),

                // Doctors Section
                Text(
                  'Available Doctors',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),

                // Doctors List
                Expanded(
                  child: ListView.separated(
                    itemCount: doctors.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.h),
                    itemBuilder: (_, index) {
                      final doctor = doctors[index];
                      return RatedCard(
                        doctorName: doctor['name'],
                        category: doctor['category'],
                        rating: doctor['rating'],
                        reviews: doctor['reviews'],
                      );
                    },
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

///// Custom Search Bar
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 22.sp, color: Colors.grey[700]),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Doctor Specialty",
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///// Category Card
class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 100.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: AppColors.accentColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 28.sp, color: AppColors.accentColor),
          ),
          SizedBox(height: 8.h),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///// Rated Card
class RatedCard extends StatelessWidget {
  final String doctorName;
  final String category;
  final double rating;
  final int reviews;

  const RatedCard({
    super.key,
    required this.doctorName,
    required this.category,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: AppColors.accentColor.withOpacity(0.1),
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: AppColors.accentColor,
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    category,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
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
                            size: 18,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        "$rating ($reviews Reviews)",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 14.h),
          MycustomButton(
            backgroundColor: AppColors.accentColor,
            height: 40,
            title: 'Make Appointment',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetaileView(
                    doctorName: doctorName,
                    category: category,
                    rating: rating,
                    reviews: reviews,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
