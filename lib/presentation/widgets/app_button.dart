import 'package:flutter/material.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/core/app_textstyles.dart';

enum AppButtonVariant { primary, secondary, circular }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
  });

  final String label;
  final VoidCallback onPressed;
  final AppButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      AppButtonVariant.circular => _buildCircularButton(),
      AppButtonVariant.secondary => _buildPillButton(
          backgroundColor: AppColors.greyBtnColor,
          foregroundColor: AppColors.primaryGreenColor,
          borderColor: Colors.transparent,
        ),
      AppButtonVariant.primary => _buildPillButton(
          backgroundColor: AppColors.primaryGreenDarkColor,
          foregroundColor: AppColors.whiteColor,
        ),
    };
  }

  Widget _buildPillButton({
    required Color backgroundColor,
    required Color foregroundColor,
    Color? borderColor,
  }) {
    return Material(
      color: backgroundColor,
      borderRadius: .circular(16),
      child: InkWell(
        onTap: onPressed,
        borderRadius: .circular(16),
        child: Container(
          padding: .symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: .circular(28),
            border: borderColor == null ? null : .all(color: borderColor),
          ),
          child: Text(
            label,
            style: AppTextStyles.button.copyWith(color: foregroundColor, fontWeight: .w500),
            textAlign: .center,
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButton() {
    return Material(
      color: AppColors.whiteColor,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Container(
          width: 72,
          height: 72,
          alignment: .center,
          decoration: BoxDecoration(
            shape: .circle,
            border: .all(color: AppColors.primaryGreenColor, width: 2),
          ),
          child: Row(
            mainAxisSize: .min,
            spacing: 2,
            children: [
              Text(
                label,
                style: AppTextStyles.button.copyWith(
                  color: AppColors.primaryGreenColor,
                  fontSize: 16,
                ),
              ),
              Icon(Icons.arrow_forward, size: 18, color: AppColors.primaryGreenColor),
            ],
          ),
        ),
      ),
    );
  }
}
