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

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {
  static const _trackWidth = 248.0;
  static const _trackHeight = 64.0;
  static const _thumbWidth = 108.0;
  static const _trackPadding = 4.0;

  late final AnimationController _imageController;
  late final AnimationController _gradientController;
  late final AnimationController _contentController;
  late final AnimationController _pulseController;

  double _dragX = 0;
  bool _isDragging = false;
  bool _isCompleting = false;
  double _thumbScale = 1;

  double get _maxDrag => _trackWidth - _thumbWidth - _trackPadding * 2;

  @override
  void initState() {
    super.initState();
    _imageController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..forward();
    _gradientController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _contentController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..forward();
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat(reverse: true);
    Future.delayed(const Duration(milliseconds: 80), () {
      if (mounted) _gradientController.forward();
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    _gradientController.dispose();
    _contentController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: .expand,
        children: [
          Positioned.fill(
            child: FadeTransition(
              opacity: _imageController,
              child: Image.asset(AppIcons.welcomeBgImg, fit: .cover),
            ),
          ),
          Positioned.fill(
            child: FadeTransition(
              opacity: _gradientController,
              child: _buildGradientWidget(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: .symmetric(horizontal: 26),
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    spacing: 24,
                    children: [
                      _buildFadeSlide(
                        start: 0,
                        end: 0.66,
                        child: Text(StringConst.welcomeHeadline, style: AppTextStyles.headline, textAlign: .center),
                      ),
                      _buildFadeSlide(start: 0.19, end: 0.84, child: _buildGoSwipe()),
                      _buildFadeSlide(start: 0.34, end: 1, child: _buildLoginRow()),
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

  Widget _buildFadeSlide({required double start, required double end, required Widget child}) {
    final curve = Interval(start, end, curve: Curves.easeOutCubic);
    return FadeTransition(
      opacity: CurvedAnimation(parent: _contentController, curve: curve),
      child: SlideTransition(
        position: Tween(begin: const Offset(0, 0.12), end: Offset.zero).animate(CurvedAnimation(parent: _contentController, curve: curve)),
        child: child,
      ),
    );
  }

  Widget _buildGradientWidget() {
    return DecoratedBox(
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
    );
  }

  Widget _buildGoSwipe() {
    final progress = (_dragX / _maxDrag).clamp(0.0, 1.0);
    return GestureDetector(
      onHorizontalDragStart: (_) {
        if (_isCompleting) return;
        setState(() => _isDragging = true);
      },
      onHorizontalDragUpdate: (details) {
        if (_isCompleting) return;
        setState(() => _dragX = (_dragX + details.delta.dx).clamp(0, _maxDrag));
      },
      onHorizontalDragEnd: (_) {
        if (!_isCompleting) _onSwipeEnd();
      },
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
            stops: const [0.47, 1],
            begin: .topLeft,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0.45, 0),
              child: AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  final pulse = _isDragging || _isCompleting ? 1.0 : 0.35 + (_pulseController.value * 0.65);
                  return Opacity(opacity: ((1 - progress) * pulse).clamp(0.15, 1), child: child);
                },
                child: Icon(Icons.keyboard_double_arrow_right, color: AppColors.whiteColor, size: 28),
              ),
            ),
            AnimatedPositioned(
              duration: _isDragging ? Duration.zero : const Duration(milliseconds: 280),
              curve: Curves.easeOutCubic,
              left: _trackPadding + _dragX,
              top: _trackPadding,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 120),
                scale: _thumbScale,
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
            ),
          ],
        ),
      ),
    );
  }

  void _onSwipeEnd() {
    final progress = (_dragX / _maxDrag).clamp(0.0, 1.0);
    if (progress >= 0.85) {
      setState(() {
        _isDragging = false;
        _isCompleting = true;
        _dragX = _maxDrag;
        _thumbScale = 1.06;
      });
      Future.delayed(const Duration(milliseconds: 90), () {
        if (mounted) setState(() => _thumbScale = 1);
      });
      Future.delayed(const Duration(milliseconds: 180), () {
        if (mounted) context.go(NamedRoutes.home.routeName);
      });
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
