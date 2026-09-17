import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/presentation/widgets/bottom_nav_bar.dart';

class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.backgroundColor,
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex),
      ),
    );
  }
}
