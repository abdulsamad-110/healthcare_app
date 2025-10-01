import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_app/ui/detaile/detaile_view.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/widgets/mycustom_button.dart';

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
