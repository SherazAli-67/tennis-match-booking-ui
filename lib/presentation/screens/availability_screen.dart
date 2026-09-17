import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_match_booking/constants/string_const.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/core/app_data.dart';
import 'package:tennis_match_booking/core/app_icons.dart';
import 'package:tennis_match_booking/core/app_textstyles.dart';
import 'package:tennis_match_booking/core/models/availability_match.dart';
import 'package:tennis_match_booking/core/models/calendar_day.dart';
import 'package:tennis_match_booking/core/models/match_player.dart';
import 'package:tennis_match_booking/presentation/widgets/app_button.dart';
import 'package:tennis_match_booking/presentation/widgets/fade_slide_in.dart';
import 'package:tennis_match_booking/presentation/widgets/scale_tap.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  State<AvailabilityScreen> createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  int _selectedDayIndex = 4;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.screenGradientBgColor.withValues(alpha: 0.37),
              AppColors.screenGradientBgColor.withValues(alpha: 0.26),
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const .symmetric(horizontal: 21.0, vertical: 4),
            child: Column(
              spacing: 15,
              children: [
                FadeSlideIn(child: _buildHeader()),
                Expanded(
                  child: ListView(
                    padding: .only(top: 14),
                    children: [
                      FadeSlideIn(delay: const Duration(milliseconds: 500), child: _buildWeekCard()),
                      const SizedBox(height: 14),
                      for (var i = 0; i < AppData.availabilityMatches.length; i++) ...[
                        FadeSlideIn(
                          delay: Duration(milliseconds: 160 + (80 * i)),
                          child: _buildMatchCard(match: AppData.availabilityMatches[i]),
                        ),
                        if (i != AppData.availabilityMatches.length - 1) const SizedBox(height: 14),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: _buildCircleIconWidget(iconData: Icons.arrow_back_rounded),
        ),
        Expanded(child: Text(StringConst.availability, style: AppTextStyles.title.copyWith(fontSize: 24),  textAlign: .center)),
        _buildCircleIconWidget(iconData: Icons.more_vert)
      ],
    );
  }

  Container _buildCircleIconWidget({IconData? iconData, String? icon, double padding = 10, double size = 24}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: .circle,
      ),
      padding: .all(padding),
      child: iconData != null ? Icon(iconData, size: size,) : SvgPicture.asset(icon!),
    );
  }

  Widget _buildWeekCard() {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: AppColors.matchCardSurfaceColor,
        borderRadius: .circular(32),
        border: .all(color: Colors.white, width: 2)
      ),
      child: Column(
        spacing: 24,
        children: [
          Row(
            spacing: 10,
            children: [
              _buildCircleIconWidget(icon: AppIcons.icCalendar),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(StringConst.availability, style: AppTextStyles.title),
                    Text(StringConst.thisWeek, style: AppTextStyles.title.copyWith(fontWeight: .w400)),
                  ],
                ),
              ),
              Row(
                spacing: 4,
                children: [
                  _buildCircleIconWidget(iconData: Icons.arrow_back_rounded, padding: 5, size: 15),
                  _buildCircleIconWidget(iconData: Icons.arrow_forward, padding: 5, size: 15),
                ],
              )
            ],
          ),
          Row(
            children: [
              for (var i = 0; i < AppData.calendarDays.length; i++)
                Expanded(child: _buildDayItem(index: i, day: AppData.calendarDays[i])),
            ],
          ),

          _buildTimeSlotCard(),
        ],
      ),
    );
  }

  Widget _buildDayItem({required int index, required CalendarDay day}) {
    final isSelected = _selectedDayIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedDayIndex = index),
      child: Column(
        spacing: 12,
        children: [
          Text(day.weekday, style: AppTextStyles.caption.copyWith(fontSize: 16,),),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            width: 38,
            height: 38,
            alignment: .center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryGreenColor.withValues(alpha: 0.41) : Colors.white,
              shape: .circle,
              border: .all(color: isSelected ? AppColors.primaryGreenColor : Colors.transparent),
            ),
            child: Text('${day.day}', style: AppTextStyles.caption.copyWith(color: AppColors.textGreyColor)),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlotCard() {
    return Container(
      padding: .symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .circular(24),
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 10,
            children: [
              SvgPicture.asset(AppIcons.icCalendar, width: 24, height: 24, colorFilter: .mode(AppColors.primaryGreenColor, .srcIn)),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: RichText(
                  key: ValueKey(AppData.calendarDays[_selectedDayIndex].label),
                  text: TextSpan(
                    text: '${AppData.calendarDays[_selectedDayIndex].label.split(' (').first} ',
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                        text: '(${AppData.calendarDays[_selectedDayIndex].label.split(' (').last}',
                        style: AppTextStyles.title.copyWith(fontWeight: .w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const .symmetric(horizontal: 16.0),
            child: Column(
              spacing: 16,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Text(StringConst.startTime, style: AppTextStyles.body),
                    Expanded(
                      child: Stack(
                        alignment: .centerLeft,
                        children: [
                          Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreenColor.withValues(alpha: 0.44),
                              borderRadius: .circular(4),
                            ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) => Align(
                              alignment: .centerLeft,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOutCubic,
                                height: 4,
                                width: constraints.maxWidth * (0.4 + (_selectedDayIndex * 0.08)).clamp(0.35, 0.92),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGreenColor,
                                  borderRadius: .circular(4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(StringConst.endTime, style: AppTextStyles.body),
                  ],
                ),
                Row(
                  spacing: 24,
                  children: [
                    Expanded(
                      child: AppButton(label: StringConst.cancel, variant: .secondary, onPressed: () => context.pop()),
                    ),
                    Expanded(
                      child: ScaleTap(
                        child: AppButton(label: StringConst.confirm, onPressed: () => context.pop()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildMatchCard({required AvailabilityMatch match}) {
    return Container(
      padding: .all(24),
      decoration: BoxDecoration(
          color: AppColors.matchCardSurfaceColor,
          borderRadius: .circular(32),
          border: .all(color: Colors.white, width: 2)
      ),
      child: Column(
        spacing: 14,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2,
                  children: [
                    Text(match.title, style: AppTextStyles.title),
                    Text(match.subtitle, style: AppTextStyles.caption),
                  ],
                ),
              ),
              Container(
                padding: .symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreenColor,
                  borderRadius: .circular(16),
                ),
                child: Text(match.status, style: AppTextStyles.button.copyWith(fontSize: 11)),
              ),
            ],
          ),
          for (final player in match.players) _buildPlayerRow(player: player),
        ],
      ),
    );
  }

  Widget _buildPlayerRow({required MatchPlayer player}) {
    return Row(
      spacing: 10,
      children: [
        Text(player.flagEmoji, style: const TextStyle(fontSize: 22)),
        Expanded(child: Text(player.name, style: AppTextStyles.bodyMedium)),
        Row(
          spacing: 14,
          children: [
            for (final score in player.setScores)
              SizedBox(
                width: 18,
                child: Text('$score', style: AppTextStyles.title, textAlign: .center),
              ),
          ],
        ),
      ],
    );
  }
}
