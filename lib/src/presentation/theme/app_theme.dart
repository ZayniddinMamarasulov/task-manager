import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final lightTeme = ThemeData(
      backgroundColor: AppColors.lightBackgroundColor,
      primaryColorLight: AppColors.lightTopGradient,
      primaryColorDark: AppColors.lightbottomGradient,
      unselectedWidgetColor: AppColors.lightNoSelectColor,
      indicatorColor: AppColors.lightTextColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightBackgroundColor,
        selectedItemColor: AppColors.lightTextColor,
        unselectedItemColor: AppColors.lightNoSelectColor,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: AppColors.lightTextColor,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        bodyText2: TextStyle(
          color: AppColors.lightTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ));

  static final darkTheme = ThemeData(
    backgroundColor: AppColors.darkBackgroundColor,
    primaryColor: AppColors.darkTextColor,
    unselectedWidgetColor: AppColors.darkNoSelectColor,
    primaryColorLight: AppColors.darkTopGradient,
    primaryColorDark: AppColors.darkTopGradient,
    indicatorColor: AppColors.darkTextColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.amber,
        fontSize: 60,
        fontWeight: FontWeight.w700,
      ),
      bodyText2: TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 26,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
//seteerr