import 'package:flutter/material.dart';
import 'package:tennis_match_booking/core/app_colors.dart';

class AppTextStyles {
  static const headline = TextStyle(
    fontFamily: 'Inter',
    fontSize: 32,
    fontWeight: .w700,
    color: AppColors.whiteColor,
    height: 1.2,
  );

  static const sectionTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: .w700,
    color: AppColors.textPrimaryColor,
  );

  static const title = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: .w600,
    color: AppColors.textPrimaryColor,
  );

  static const body = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: .w400,
    color: AppColors.textPrimaryColor,
  );

  static const bodyMedium = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: .w500,
    color: AppColors.textPrimaryColor,
  );

  static const caption = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: .w400,
    color: AppColors.textMutedColor,
  );

  static const button = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: .w600,
    color: AppColors.whiteColor,
  );

  static const greeting = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: .w600,
    color: AppColors.textPrimaryColor,
  );

  static const chip = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: .w500,
    color: AppColors.textPrimaryColor,
  );
}
