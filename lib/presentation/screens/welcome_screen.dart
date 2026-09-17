import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_match_booking/constants/string_const.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/core/app_icons.dart';
import 'package:tennis_match_booking/core/app_textstyles.dart';
import 'package:tennis_match_booking/presentation/widgets/app_button.dart';
import 'package:tennis_match_booking/router/router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppIcons.welcomeBgImg),
            fit: .cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: .topCenter,
              end: .bottomCenter,
              colors: [
                AppColors.blackColor.withValues(alpha: 0),
                AppColors.primaryGreenColor.withValues(alpha: 0.5),
                AppColors.primaryGreenColor,
              ],
              stops: const [0.4, 0.68, 1],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: .fromLTRB(32, 0, 32, 40),
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    spacing: 28,
                    children: [
                      Text(StringConst.welcomeHeadline, style: AppTextStyles.headline, textAlign: .center),
                      AppButton(
                        label: StringConst.go,
                        variant: .circular,
                        onPressed: () => context.go(NamedRoutes.home.routeName),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
