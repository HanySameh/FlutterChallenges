import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorName.white,
          foregroundColor: ColorName.primaryTextColor,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: ColorName.primaryColor,
          onPrimary: ColorName.white,
          surface: ColorName.white,
          onSurface: ColorName.primaryTextColor,
          background: ColorName.background,
          onBackground: ColorName.primaryTextColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.avenir,
                color: ColorName.primaryColor,
              ),
            ),
          ),
        ),
        textTheme:  const TextTheme(
          titleLarge: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: ColorName.primaryTextColor,
          ),
          headlineSmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: ColorName.primaryTextColor,
          ),
          headlineMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: ColorName.primaryTextColor,
          ),
          bodySmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: ColorName.captionTextColor,
          ),
          titleMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w200,
            fontSize: 18,
            color: ColorName.secondaryTextColor,
          ),
          titleSmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: ColorName.primaryTextColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 12,
            color: ColorName.secondaryTextColor,
          ),
          bodyLarge: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: ColorName.primaryTextColor,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      );
}
