import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_match_booking/constants/string_const.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/core/app_icons.dart';
import 'package:tennis_match_booking/core/app_textstyles.dart';
import 'package:tennis_match_booking/router/router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static const _trackWidth = 248.0;
  static const _trackHeight = 64.0;
  static const _thumbWidth = 108.0;
  static const _trackPadding = 4.0;

  double _dragX = 0;
  bool _isDragging = false;

  double get _maxDrag => _trackWidth - _thumbWidth - _trackPadding * 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: .expand,
        children: [
          Positioned.fill(child: Image.asset(AppIcons.welcomeBgImg, fit: .cover)),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .center,
                  end: .bottomCenter,
                  colors: [
                    AppColors.gradientColor1.withValues(alpha: 0.01),
                    AppColors.gradientColor1,
                    AppColors.gradientColor1,
                  ],
                  stops: const [0, 0.42, 1],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: .fromLTRB(28, 0, 28, 28),
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    spacing: 24,
                    children: [
                      Text(StringConst.welcomeHeadline, style: AppTextStyles.headline, textAlign: .center),
                      _buildGoSwipe(),
                      _buildLoginRow(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoSwipe() {
    final progress = (_dragX / _maxDrag).clamp(0.0, 1.0);
    return GestureDetector(
      onHorizontalDragStart: (_) => setState(() => _isDragging = true),
      onHorizontalDragUpdate: (details) => setState(() => _dragX = (_dragX + details.delta.dx).clamp(0, _maxDrag)),
      onHorizontalDragEnd: (_) => _onSwipeEnd(progress: progress),
      child: Container(
        width: _trackWidth,
        height: _trackHeight,
        decoration: BoxDecoration(
          borderRadius: .circular(40),
          gradient: LinearGradient(
            colors: [
              AppColors.whiteColor.withValues(alpha: 0.2),
              AppColors.gradientColor1,
            ],
            stops: [0.47, 1],
            begin: .topLeft
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0.45, 0),
              child: Opacity(
                opacity: (1 - progress).clamp(0.15, 1),
                child: Icon(Icons.keyboard_double_arrow_right, color: AppColors.whiteColor, size: 28),
              ),
            ),
            AnimatedPositioned(
              duration: _isDragging ? Duration.zero : const Duration(milliseconds: 280),
              curve: Curves.easeOutCubic,
              left: _trackPadding + _dragX,
              top: _trackPadding,
              child: Container(
                width: _thumbWidth,
                height: _trackHeight - _trackPadding * 2,
                alignment: .center,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: .circular(40),
                ),
                child: Text(
                  StringConst.go,
                  style: AppTextStyles.button.copyWith(color: AppColors.primaryGreenColor, fontSize: 16, fontWeight: .w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSwipeEnd({required double progress}) {
    if (progress >= 0.85) {
      context.go(NamedRoutes.home.routeName);
      return;
    }
    setState(() {
      _isDragging = false;
      _dragX = 0;
    });
  }

  Widget _buildLoginRow() {
    return GestureDetector(
      onTap: () => context.go(NamedRoutes.home.routeName),
      child: Text.rich(
        TextSpan(
          text: StringConst.alreadyHaveAccount,
          style: AppTextStyles.loginHint,
          children: [
            TextSpan(
              text: StringConst.logIn,
              style: AppTextStyles.loginHint.copyWith(fontWeight: .w700, decoration: .underline, decorationColor: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
