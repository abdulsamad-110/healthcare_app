import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isAdult = true.obs;

  // Categories (Adult)
  final List<Map<String, dynamic>> adultCategories = [
    {"title": "Cardiology", "icon": Icons.favorite},
    {"title": "Neurology", "icon": Icons.psychology},
    {"title": "Dentistry", "icon": Icons.medical_services},
    {"title": "Orthopedics", "icon": Icons.accessibility_new},
    {"title": "Dermatology", "icon": Icons.face_retouching_natural},
  ];

  // Categories (Children)
  final List<Map<String, dynamic>> childrenCategories = [
    {"title": "Pediatrics", "icon": Icons.child_care},
    {"title": "Vaccination", "icon": Icons.vaccines},
    {"title": "Nutrition", "icon": Icons.lunch_dining},
    {"title": "Growth", "icon": Icons.trending_up},
  ];

  // Doctors (Adult)
  final List<Map<String, dynamic>> adultDoctors = [
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

  // Doctors (Children)
  final List<Map<String, dynamic>> childrenDoctors = [
    {
      "name": "Dr. Hina Qureshi",
      "category": "Pediatrician",
      "rating": 4.9,
      "reviews": 150,
    },
    {
      "name": "Dr. Imran Siddiqui",
      "category": "Child Specialist",
      "rating": 4.7,
      "reviews": 120,
    },
    {
      "name": "Dr. Sana Farooq",
      "category": "Nutritionist (Children)",
      "rating": 4.8,
      "reviews": 95,
    },
  ];

  /// Toggle logic
  void selectAdult() => isAdult.value = true;
  void selectChildren() => isAdult.value = false;

  /// Get active categories based on selection
  List<Map<String, dynamic>> get activeCategories =>
      isAdult.value ? adultCategories : childrenCategories;

  /// Get active doctors based on selection
  List<Map<String, dynamic>> get activeDoctors =>
      isAdult.value ? adultDoctors : childrenDoctors;
}
