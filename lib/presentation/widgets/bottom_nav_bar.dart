import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/core/app_icons.dart';

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
    AppIcons.icNotification,
    AppIcons.icUser,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            for (var i = 0; i < _icons.length; i++)
              _buildNavItem(index: i, iconPath: _icons[i]),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required int index, required String iconPath}) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: 48,
        height: 48,
        alignment: .center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreenColor : Colors.transparent,
          shape: .circle,
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          colorFilter: .mode(
            isSelected ? AppColors.whiteColor : AppColors.primaryGreenColor,
            .srcIn,
          ),
        ),
      ),
    );
  }
}
