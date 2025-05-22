import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/colors.dart';

class AppThemes {
  static final whiteTheme = ThemeData(
    dropdownMenuTheme:
        const DropdownMenuThemeData(textStyle: TextStyle(color: Colors.black)),
    hintColor: AppColors.blackColor,
    dividerTheme: const DividerThemeData(color: Colors.transparent),
    fontFamily: 'Cairo',
    primaryColor: AppColors.blackColor,
    scaffoldBackgroundColor: Colors.white,
    cardColor: AppColors.whiteColor,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.resolveWith((states) => Colors.white)),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Cairo',
      ),
      titleMedium: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Cairo',
      ),
      titleSmall: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Cairo',
      ),
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Cairo',
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Cairo',
      ),
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Cairo',
      ),
    ),
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(size: 13.sp),
      titleSpacing: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor,
          fontFamily: 'Cairo'),
      elevation: 0,
      backgroundColor: AppColors.grey,
    ),
    secondaryHeaderColor: AppColors.whiteColor,
    highlightColor: Colors.transparent,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.blackColor),
    hoverColor: Colors.transparent,
  );
}
