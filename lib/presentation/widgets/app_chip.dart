import 'package:flutter/material.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/core/app_textstyles.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: .symmetric(horizontal: 17.49, vertical: 8.75),
        alignment: .center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreenColor : AppColors.whiteColor,
          borderRadius: .circular(24),
          border: .all(color: isSelected ? Colors.transparent : AppColors.whiteColor)
        ),
        child: Text(
          label,
          style: AppTextStyles.chip.copyWith(
            color: isSelected ? AppColors.whiteColor : AppColors.textMutedColor,
            fontWeight: isSelected ? .w600 : .w400
          ),
        ),
      ),
    );
  }
}
