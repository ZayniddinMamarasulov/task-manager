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
      cardColor: AppColors.lightButtomBackgroundColor,
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
        headline1: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        headline2: TextStyle(
          color: AppColors.lightButtomTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
      ));

  static final darkTheme = ThemeData(
    backgroundColor: AppColors.darkBackgroundColor,
    primaryColor: AppColors.darkTextColor,
    unselectedWidgetColor: AppColors.darkNoSelectColor,
    primaryColorLight: AppColors.darkTopGradient,
    primaryColorDark: AppColors.darkTopGradient,
    indicatorColor: AppColors.darkTextColor,
    cardColor: AppColors.darkButtomBackgroundColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      bodyText2: TextStyle(
        color: AppColors.lightButtomTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      headline1: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        color: AppColors.darkButtomTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
//seteerr