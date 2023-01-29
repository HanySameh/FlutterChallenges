import 'package:flutter/material.dart';

class CourseModel {
  final String title, description, iconSrc;
  final Color bgColor;

  CourseModel({
    required this.title,
    this.description = "Build and animate an iOS app from scratch",
    this.iconSrc = "assets/icons/ios.svg",
    this.bgColor = const Color(0xFF7553F6),
  });
}

List<CourseModel> coursesList = [
  CourseModel(title: "Animations in SwiftUI"),
  CourseModel(
    title: "Animations in Flutter",
    iconSrc: "assets/icons/code.svg",
    bgColor: const Color(0xFF80A4FF),
  ),
];

List<CourseModel> recentCourses = [
  CourseModel(title: "State Machine"),
  CourseModel(
    title: "Animated Menu",
    bgColor: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
  CourseModel(title: "Flutter with Rive"),
  CourseModel(
    title: "Animated Menu",
    bgColor: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
];
