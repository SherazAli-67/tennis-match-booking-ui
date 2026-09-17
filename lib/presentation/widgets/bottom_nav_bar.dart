import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/core/app_icons.dart';
import 'package:tennis_match_booking/core/app_textstyles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _icons = [
    AppIcons.icHome,
    AppIcons.icCalendar,
    AppIcons.icTrophy,
    AppIcons.icUser,
  ];

  static const _labels = [
    'Home',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: .fromLTRB(24, 0, 24, 12),
        child: Container(
          padding: .symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: .circular(40),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              for (var i = 0; i < _icons.length; i++)
                _buildNavItem(index: i, iconPath: _icons[i], label: _labels[i]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required int index, required String iconPath, required String label}) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: .symmetric(horizontal: isSelected && label.isNotEmpty ? 14 : 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreenColor : Colors.transparent,
          borderRadius: .circular(28),
        ),
        child: Row(
          mainAxisSize: .min,
          spacing: 6,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22,
              height: 22,
              colorFilter: .mode(
                isSelected ? AppColors.whiteColor : AppColors.primaryGreenColor,
                .srcIn,
              ),
            ),
            if (isSelected && label.isNotEmpty)
              Text(label, style: AppTextStyles.button.copyWith(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
