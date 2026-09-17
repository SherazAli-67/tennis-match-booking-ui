import 'package:flutter/material.dart';
import 'package:tennis_match_booking/constants/string_const.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.appTitle,
      theme: ThemeData(
        brightness: .light,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryGreenColor,
          secondary: AppColors.primaryGreenDarkColor,
          surface: AppColors.surfaceColor,
          onPrimary: AppColors.whiteColor,
          onSecondary: AppColors.whiteColor,
          onSurface: AppColors.textPrimaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          foregroundColor: AppColors.textPrimaryColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: .w600,
            color: AppColors.textPrimaryColor,
          ),
        ),
      ),
      routerConfig: router,
      builder: (ctx, child) => child!,
    );
  }
}
